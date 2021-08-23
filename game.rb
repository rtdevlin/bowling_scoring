require './frame'
class Game
  attr_reader :frames
  delegate :bowl_frame, to: :rule_set
  def initialize(number_of_frames, rules = StandardRules.new)
    @rule_set = rules
    @frames = []
    number_of_frames.times {@frames.push(Frame.new)}
    @frame[-1].set_last_frame
  end
end
