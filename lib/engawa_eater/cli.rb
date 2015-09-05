require "engawa_eater"
require "thor"

module EngawaEater
  class CLI < Thor
    desc "start", "play the eat a lot engawa game."
    def start
      puts "eat only '炙りえんがわ'（e:eat, p:pass）"
      sushis = ["炙りえんがわ", "えんがわ", "炙りサーモン"]
      score = 0
      10.times do
        gave_sushi = sushis.sample
        puts gave_sushi
        action = STDIN.gets.chomp!
        if gave_sushi == "炙りえんがわ"
          score += 1 if action == "e"
        else
          score += 1 if action == "p"
        end
      end
      puts "炙りえんがわ #{score * 10}%！"
    end
  end
end
