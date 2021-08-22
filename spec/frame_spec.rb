require 'rspec'
require './frame'
require './throw'

describe 'Frame' do
  before do
    @frame = Frame.new
  end


  context '#add_ball' do
    it 'will add a Throw object to the throws container' do
      @frame.add_ball(Throw.new(9))
      expect(@frame.how_many_throws).to eq(1)
    end
  end
end