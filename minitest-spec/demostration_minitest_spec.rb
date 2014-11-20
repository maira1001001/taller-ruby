require 'minitest/autorun'
require 'ostruct'

describe Hipster, "Demostration of Minitest" do


  #Run codes before each expectation
  before do
    @hipster=OpenStruct.new
  end

  #Runs code after each expectation
  after do
    @hipster.destroy!
  end

  #Define accessors - lazily runs code when it's first used
  let(:hipster) {OpenStruct.new}
  let(:hipster) { ["silly hats", "skinny jeans"] }


end
