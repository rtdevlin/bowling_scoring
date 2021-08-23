require 'rspec'
require './frame'
require './ball'

describe 'Frame' do
  before do
    @frame = Frame.new
  end


  context '#add_ball' do
    it "it will raise ArgumentError if ball isn't a Ball object" do
      expect {@frame.add_ball("this is not a ball")}.to raise_error(ArgumentError)
    end
    it 'will add a Ball object to the throws container' do
      @frame.add_ball(Ball.new(9))
      expect(@frame.how_many_throws).to eq(1)
    end
  end
end