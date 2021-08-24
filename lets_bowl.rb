require './game/game'
game = Game.new(3)
game.frames.each_with_index do |frame, idx|
  puts "Bowling Frame ##{idx+1}"
  game.bowl_frame(frame)
end
puts game.to_s