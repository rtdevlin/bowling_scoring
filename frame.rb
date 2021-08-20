class Frame
  def initialize
    @throws = []
  end

  def add_ball(ball)
    @throws.push(ball)
  end

  def how_many_throws
    @throws.size
  end
end
