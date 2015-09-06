require "thor"
require "timeout"
require_relative 'sushi'

module EngawaEater
  class CLI < Thor
    desc "only", "Game of eat only '炙りえんがわ'."
    def only
      # NOTE: 寿司は不可算名詞
      all_sushi = [
        Sushi.new(name: '炙りえんがわ', score: 1),
        Sushi.new(name: 'えんがわ',     score: 1),
        Sushi.new(name: '炙りサーモン', score: 1)
      ]
      only_start_mesasge
      STDIN.gets
      score = only_run(all_sushi)
      puts "炙りえんがわ #{score.nil? ? 0 : score * 10}%！"
    end

    desc "many", "Game of continue to eat 'えんがわ' and '炙りえんがわ'."
    def many
      all_sushi = [
        Sushi.new(name: '炙りえんがわ', score: 3, stomach_status: 4),
        Sushi.new(name: 'えんがわ',     score: 1, stomach_status: 2),
        Sushi.new(name: '芽ねぎ',       score: 0, stomach_status: -4),
        Sushi.new(name: '炙りほたて',   score: 0, stomach_status: 2),
        Sushi.new(name: 'マグロ',       score: 0, stomach_status: 2),
        Sushi.new(name: 'サーモン',     score: 0, stomach_status: 2),
      ]
      sec = 30
      max_stomach_capacity = 20
      many_start_mesasge(sec, max_stomach_capacity)
      STDIN.gets
      many_run(all_sushi, sec, max_stomach_capacity)
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

    def many_start_mesasge(sec, max_stomach_capacity)
      puts <<-EOS
--------------------------------------------------
continue to eat '炙りえんがわ' and 'えんがわ'（e:eat, p:pass）
Time limit:#{sec}sec, Max stomach capacity:#{max_stomach_capacity}
炙りえんがわ（score:+3, stomach status:+4）
えんがわ（score:+1, stomach status:+2）
芽ねぎ（stomach status:-4）
Other（stomach status:+2）
--------------------------------------------------
Start: Press Enter
      EOS
    end

    def questions(all_sushi)
      Array.new(10).map { all_sushi.sample }
    end

    def only_run(all_sushi)
      questions(all_sushi).map do |sushi|
        puts sushi.name
        aburi_engawa_check(sushi)
      end.compact.inject(:+)
    end

    def many_run(all_sushi, sec, max_stomach_capacity)
      stomach_status = 0
      score = 0
      begin
        timeout(sec) do
          while stomach_status <= max_stomach_capacity
            sushi = all_sushi.sample
            puts "#{sushi.name}#{display_result(score, stomach_status)}"
            if STDIN.gets.chomp! == 'e'
              score += sushi.score
              stomach_status += sushi.stomach_status
            end
          end
          puts "Can’t eat anymore!#{display_result(score, stomach_status)}"
        end
      rescue
        puts "Time's UP!#{display_result(score, stomach_status)}"
      end
    end

    def display_result(score, stomach_status)
      "（SCORE:#{score}, STOMACH:#{stomach_status}）"
    end

    def aburi_engawa_check(sushi)
      timeout(1.2) do
        case STDIN.gets.chomp!
        when 'e' then sushi.score if sushi.name == '炙りえんがわ'
        when 'p' then sushi.score unless sushi.name == '炙りえんがわ'
        end
      end
    rescue Timeout::Error
      # 何もしない
    end
  end
  CLI.start(ARGV)
end
