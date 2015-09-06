require "thor"
require "timeout"

module EngawaEater
  class CLI < Thor
    desc "only", "Game of eat only '炙りえんがわ'."
    def only
      only_start_mesasge
      STDIN.gets
      all_sushi = %w[炙りえんがわ えんがわ 炙りサーモン] # NOTE: 寿司は不可算名詞
      puts "炙りえんがわ #{run(all_sushi) * 10}%！"
    end

    private

    def only_start_mesasge
      puts <<-EOS
----------------------------------------
eat only '炙りえんがわ'（e:eat, p:pass）
----------------------------------------
Start: Press Enter
      EOS
    end

    def questions(all_sushi)
      Array.new(10).map { all_sushi.sample }
    end

    def run(all_sushi)
      questions(all_sushi).map do |sushi|
        puts sushi
        begin
          timeout(1.2) do
            case STDIN.gets.chomp!
            when 'e' then 1 if sushi == '炙りえんがわ' # TODO: マジックナンバーやめる
            when 'p' then 1 unless sushi == '炙りえんがわ' # TODO: マジックナンバーやめる
            end
          end
        rescue Timeout::Error
          # 何もしない
        end
      end.compact.inject(:+)
    end
  end
  CLI.start(ARGV)
end

=begin
    desc "many", "Game of continue to eat 'えんがわ' and '炙りえんがわ'."
    def many
      sec = 30
      max_stomach_capacity = 20
      puts <<-EOS
--------------------------------------------------
continue to eat '炙りえんがわ' and 'えんがわ'（e:eat, p:pass）
Time limit:#{sec}sec, Max stomach capacity:#{max_stomach_capacity}
炙りえんがわ（score:+3, stomach status:+4）
えんがわ（score:+1, stomach status:+2）
芽ねぎ（stomach status:-4）
Oters（stomach status:+2）
--------------------------------------------------
Start: Press Enter
      EOS
      STDIN.gets
      sushis = ["炙りえんがわ", "えんがわ", "芽ねぎ", "炙りほたて", "マグロ", "サーモン"]
      stomach_status = 0
      score = 0
      begin
        timeout(sec) {
          while stomach_status <= max_stomach_capacity
            gave_sushi = sushis.sample
            puts "#{gave_sushi}（SCORE:#{score}, STOMACH:#{stomach_status}）"
            action = STDIN.gets.chomp!
            case gave_sushi
            when "炙りえんがわ"
              if action == "e"
                score += 3
                stomach_status += 4
              end
            when "えんがわ"
              if action == "e"
                score += 1
                stomach_status += 2
              end
            when "芽ねぎ"
              stomach_status -= 4 if action == "e"
            else
              stomach_status += 2 if action == "e"
            end
          end
          puts "Can’t eat anymore!（SCORE:#{score}, STOMACH:#{stomach_status}）"
        }
      rescue
        puts "Time's UP!（SCORE:#{score}, STOMACH:#{stomach_status}）"
      end
    end
=end
