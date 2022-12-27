class Frame
  attr_reader :ball_values, :ball_strings, :multipliers, :score, :remaining_pins, :is_closed

  def initialize(is_last_frame)
    @ball_values = []
    @ball_strings = []
    @multipliers = 0
    @score = 0
    @remaining_pins = 10
    @is_closed = false
    @is_last_frame = is_last_frame
  end

  def add_ball(ball)
    if (ball > @remaining_pins)
      return "invalid frame"
    end

    @ball_values.push(ball)

    if @is_last_frame && @multipliers > 0
      @multipliers = @multipliers - 1
      @score = @score + ball

      if ball == 10
        @ball_strings.push("X")
        if @multipliers == 0
          @remaining_pins = 0
        else
          @remaining_pins = 10
        end
      elsif ball == @remaining_pins
        @ball_strings.push("/")
        if @multipliers == 0
          @remaining_pins = 0
        else
          @remaining_pins = 10
        end
      elsif ball == 0
        @ball_strings.push("-")
      else
        @ball_strings.push(ball.to_s())
        @remaining_pins = @remaining_pins - ball
      end
    elsif
      if ball == 10
        @ball_strings.push("X")
        @multipliers = 2
        @score = 10
        if !@is_last_frame
          @remaining_pins = 0
          @is_closed = true
        else
          @remaining_pins = 10
          @is_closed = false
        end
      elsif ball == @remaining_pins
        @ball_strings.push("/")
        @multipliers = 1
        @score = 10
        if !@is_last_frame
          @remaining_pins = 0
          @is_closed = true
        else
          @remaining_pins = 10
          @is_closed = false
        end
      elsif ball == 0
        @ball_strings.push("-")
        if @ball_values.length() >= 2
          @is_closed = true
        end
      else
        @ball_strings.push(ball.to_s())
        @score = @score + ball
        @remaining_pins = @remaining_pins - ball
        if @ball_values.length() >= 2
          @is_closed = true
        end
      end
    end
    
    return "OK"
  end

  def update_score(next_frame, frame_after_next_frame)
    if multipliers == 1 && next_frame != nil
      @score = @ball_values.sum()
      @score = @score + next_frame.ball_values[0]
    elsif multipliers == 2 && next_frame != nil
      @score = @ball_values.sum()
      @score = @score + next_frame.ball_values[0]
      if next_frame.ball_values[1] != nil
        @score = @score + next_frame.ball_values[1]
      elsif frame_after_next_frame != nil
        @score = @score + frame_after_next_frame.ball_values[0]
      end
    end
  end
end 