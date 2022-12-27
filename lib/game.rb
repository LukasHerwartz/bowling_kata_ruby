require 'frame'

class Game
  def initialize
    @frames = []
    @current_frame = Frame.new(false)
    @frames.push(@current_frame)
  end

  def add_ball(ball)
    if (ball < 0 || ball > 10)
      return "invalid ball"
    end

    if (@current_frame.is_closed)
      if (@frames.length() >= 10)
        return "game is closed"
      end

      @current_frame = Frame.new(@frames.length() == 9)
      @frames.push(@current_frame)
    end

    frame_result = @current_frame.add_ball(ball)
    if frame_result != "OK"
      return frame_result
    end
    
    score = 0
    @frames.each_with_index {
      |frame, index|
      frame.update_score(@frames[index+1], @frames[index+2])
      score += frame.score
    }

    return "OK"
  end

  def display()
    game_string = ""
    score = 0

    @frames.each {
      |frame|
      frame_string = "[Balls: "
      frame.ball_strings.each_with_index  {
        |ball_string, index|
        if (index != 0)
          frame_string += ", "
        end
        frame_string += ball_string
      }
      score = score + frame.score
      frame_string += "; Score: #{score.to_s()}]"
      game_string += frame_string
    }
    return game_string
  end
end