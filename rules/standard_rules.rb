class StandardRules
  MAX_PINS = 10
  MIN_PINS = 0

  def bowl_frame(frame)
    frame_done = false
    until frame_done do
      puts "Enter your throw: "
      pins = gets.to_i
      raise ArgumentError if pins > MAX_PINS or pins < MIN_PINS
      frame.add_ball(Ball.new(pins))
      unless frame.last_frame?
        if frame.how_many_throws == 1 && frame.pins == MAX_PINS
          frame.set_result :strike
          frame_done = true
        elsif frame.how_many_throws == 2
          if frame.pins == MAX_PINS
            frame.set_result :spare
            frame_done = true
          else
            frame.set_result :open
            frame_done = true
          end
        end
      else
        if frame.how_many_throws == 1 && frame.pins == MAX_PINS
          frame.set_result :strike
          next
        elsif frame.how_many_throws == 2
          if frame.is_strike?
            next
          elsif frame.pins == MAX_PINS
            frame.set_result :spare
            next
          else
            frame.set_result :open
            frame_done = true
          end
        end
      end
      if frame.how_many_throws == 3
        frame_done = true
      end
    end
  end
end