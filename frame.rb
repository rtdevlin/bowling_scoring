require './ball'
class Frame
  def self.valid_results
    [:strike, :spare, :open]
  end

  def initialize
    @last_frame = false
    @throws = []
    @result
  end

  def add_ball(ball)
    raise ArgumentError unless ball.is_a? Ball
    @throws.push(ball)
  end

  def set_result(result)
    raise ArgumentError unless valid_results.include? result
    @result = result
  end

  def set_last_frame
    @frame = true
  end

  def last_frame?
    @last_frame
  end

  def pins
    @throws.reduce(0){|sum, ball| sum += ball.pins}
  end

  def how_many_throws
    @throws.size
  end

  def is_strike?
    @result == :strike
  end
  def is_spare?
    @result == :spare
  end
  def is_open?
    @result == :open
  end
end
