require 'rspec'
require './game'

describe Game do
  context "#frames" do
    it "will return frames with the proper number of frames" do
      game = Game.new(5)
      expect(game.frames.size).to eq(5)
      game = Game.new(10)
      expect(game.frames.size).to eq(10)
    end
  end
end
