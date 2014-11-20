require 'minitest/autorun'
require_relative 'person'

describe Person do
  
  before do
    @person = Person.new("Maira", "Diaz")
  end

  describe 'when name is empty' do 
    it 'is not valid' do
      person = Person.new("", "")
      person.wont_be :valid?
    end
  end

  describe 'when name is not empty' do
    it 'is valid' do
      @person.must_be :valid?
    end
    it 'has a full name' do
      @person.full_name.must_equal "Maira Diaz"
    end

  end
end
