require 'game'

describe "the_add_ball_function" do
  context "adds_the_ball" do
    it "to_a_new_game" do
      game = Game.new()
      expect(game.add_ball(4)).to eq("OK")
      expect(game.display()).to eq("[Balls: 4; Score: 4]")
    end

    it "to_an_open_game" do
      game = Game.new()
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.display()).to eq("[Balls: 1, 2; Score: 3][Balls: 4; Score: 7]")
    end

    it "to_a_new_frame" do
      game = Game.new()
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.display()).to eq("[Balls: 1, 2; Score: 3][Balls: 3, 4; Score: 10][Balls: 4; Score: 14]")
    end

    it "to_an_open_frame" do
      game = Game.new()
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.display()).to eq("[Balls: 1, 2; Score: 3][Balls: 3, 2; Score: 8][Balls: 1, 4; Score: 13]")
    end
    
    it "at_the_end_of_a_game" do
      game = Game.new()
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.display()).to eq("[Balls: 1, 2; Score: 3][Balls: 3, 4; Score: 10][Balls: 3, 2; Score: 15][Balls: 1, 2; Score: 18][Balls: 3, 4; Score: 25][Balls: 3, 2; Score: 30][Balls: 1, 2; Score: 33][Balls: 3, 4; Score: 40][Balls: 3, 2; Score: 45][Balls: 1, 4; Score: 50]")
    end

    it "not_to_a_closed_game" do
      game = Game.new()
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(4)).to eq("game is closed")
    end

    it "additionally_after_a_last_spare" do
      game = Game.new()
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(9)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.display()).to eq("[Balls: 1, 2; Score: 3][Balls: 3, 4; Score: 10][Balls: 3, 2; Score: 15][Balls: 1, 2; Score: 18][Balls: 3, 4; Score: 25][Balls: 3, 2; Score: 30][Balls: 1, 2; Score: 33][Balls: 3, 4; Score: 40][Balls: 3, 2; Score: 45][Balls: 1, /, 4; Score: 59]")
    end

    it "additionally_after_a_last_strike" do
      game = Game.new()
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(3)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(4)).to eq("OK")
      expect(game.display()).to eq("[Balls: 1, 2; Score: 3][Balls: 3, 4; Score: 10][Balls: 3, 2; Score: 15][Balls: 1, 2; Score: 18][Balls: 3, 4; Score: 25][Balls: 3, 2; Score: 30][Balls: 1, 2; Score: 33][Balls: 3, 4; Score: 40][Balls: 3, 2; Score: 45][Balls: X, 4, 4; Score: 63]")
    end

    it "to_end_a_perfect_game" do
      game = Game.new()
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.display()).to eq("[Balls: X; Score: 30][Balls: X; Score: 60][Balls: X; Score: 90][Balls: X; Score: 120][Balls: X; Score: 150][Balls: X; Score: 180][Balls: X; Score: 210][Balls: X; Score: 240][Balls: X; Score: 270][Balls: X, X, X; Score: 300]")
    end

    it "with_a_score_of_0" do
      game = Game.new()
      expect(game.add_ball(0)).to eq("OK")
      expect(game.display()).to eq("[Balls: -; Score: 0]")
    end

    it "not_with_a_score_below_0" do
      game = Game.new()
      expect(game.add_ball(-1)).to eq("invalid ball")
    end

    it "with_a_strike" do
      game = Game.new()
      expect(game.add_ball(10)).to eq("OK")
      expect(game.display()).to eq("[Balls: X; Score: 10]")
    end

    it "not_with_a_score_above_10" do
      game = Game.new()
      expect(game.add_ball(11)).to eq("invalid ball")
    end

    it "with_a_spare" do
      game = Game.new()
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(6)).to eq("OK")
      expect(game.display()).to eq("[Balls: 4, /; Score: 10]")
    end

    it "not_with_a_score_above_10_in_the_frame" do
      game = Game.new()
      expect(game.add_ball(4)).to eq("OK")
      expect(game.add_ball(7)).to eq("invalid frame")
    end

    it "to_an_example_game" do
      game = Game.new()
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(9)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(5)).to eq("OK")
      expect(game.add_ball(5)).to eq("OK")
      expect(game.add_ball(7)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.add_ball(9)).to eq("OK")
      expect(game.add_ball(0)).to eq("OK")
      expect(game.add_ball(8)).to eq("OK")
      expect(game.add_ball(2)).to eq("OK")
      expect(game.add_ball(9)).to eq("OK")
      expect(game.add_ball(1)).to eq("OK")
      expect(game.add_ball(10)).to eq("OK")
      expect(game.display()).to eq("[Balls: X; Score: 20][Balls: 9, /; Score: 35][Balls: 5, /; Score: 52][Balls: 7, 2; Score: 61][Balls: X; Score: 91][Balls: X; Score: 120][Balls: X; Score: 139][Balls: 9, -; Score: 148][Balls: 8, /; Score: 167][Balls: 9, /, X; Score: 187]")
    end
  end
end