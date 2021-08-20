require './frame'
class Game
  attr_reader :frames
  def initialize(number_of_frames)
    @frames = []
    number_of_frames.times {@frames.push(Frame.new)}
  end
end
