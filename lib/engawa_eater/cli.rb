require "engawa_eater"
require "thor"
require "timeout"

module EngawaEater
  class CLI < Thor
    desc "only", "Game of eat only '炙りえんがわ'."
    def only
      puts <<EOS
----------------------------------------
eat only '炙りえんがわ'（e:eat, p:pass）
----------------------------------------
Start: Press Enter
EOS
      STDIN.gets
      sushis = ["炙りえんがわ", "えんがわ", "炙りサーモン"]
      score = 0
      10.times do
        gave_sushi = sushis.sample
        puts gave_sushi
        action = ""
        begin
          timeout(1.2) {
            action = STDIN.gets.chomp!
          }
        rescue
        end
        if gave_sushi == "炙りえんがわ"
          score += 1 if action == "e"
        else
          score += 1 if action == "p"
        end
      end
      puts "炙りえんがわ #{score * 10}%！"
    end

    desc "many", "Game of continue to eat 'えんがわ' and '炙りえんがわ'."
    def many
      sec = 30
      max_stomach_capacity = 20
      puts <<EOS
--------------------------------------------------
continue to eat '炙りえんがわ' and 'えんがわ'（e:eat, p:pass）
Time limit:#{sec}sec, Max stomach capacity:#{max_stomach_capacity}
炙りえんがわ（score:+3, stomach status:+4）
えんがわ（score:+1, stomach status:+2）
芽ねぎ（stomach status:-4）
Others（stomach status:+2）
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
  end
end
