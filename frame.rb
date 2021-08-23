require './ball'
class Frame
  def initialize
    @throws = []
  end

  def add_ball(ball)
    raise ArgumentError unless ball.is_a? Ball
    @throws.push(ball)
  end

  def how_many_throws
    @throws.size
  end
end
