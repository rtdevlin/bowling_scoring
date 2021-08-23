class StandardRules
  MAX_PINS = 10
  MIN_PINS = 1
  def bowl_frame(frame)
    frame_done = false
    until frame_done do
      puts "Enter your throw: "
      pins = gets.to_i
      raise ArgumentError if pins > MAX_PINS or pins < MIN_PINS
      frame.add_ball(Ball.new(pins))
      unless frame.last_frame?
        if(frame.number_of_balls == 1 && frame.pins == MAX_PINS)
          frame.set_result :strike
          frame_done = true
        end
        if(frame.number_of_balls == 2 && frame.pins == MAX_PINS)
          frame.set_result :spare
          frame_done = true
        else
          frame.set_result :open
          frame_done = true
        end
      else
        if(frame.number_of_balls == 1 && frame.pins == MAX_PINS)
          frame.set_result :strike
          next
        end
        if(frame.number_of_balls == 2 && frame.pins == MAX_PINS)
          frame.set_result :spare
          next
        else
          frame.set_result :open
          frame_done = true
        end
        if(frame.number_of_balls == 3)
          frame_done = true
        end
      end
    end
  end
end