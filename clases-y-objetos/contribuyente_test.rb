require 'minitest/autorun'
require_relative 'contribuyente'

describe Contribuyente do

  let(:contribuyente){Contribuyente.new("Maira", "Diaz", 111,222,123456789)}

  describe 'the type of Object we are dealing with' do
    it 'is an instance Contribuyente' do
      contribuyente=Contribuyente.new("Maira", "Diaz", 1111, 222)
      contribuyente.must_be_instance_of Contribuyente
    end
  end

  describe 'when we asked about the #nombre' do
    it 'should not be empty' do
      contribuyente.nombre.wont_be_empty
    end
    it 'should return an string' do
      contribuyente.nombre.must_be_instance_of String
    end
    it 'should be consistent' do
      contribuyente.nombre.must_equal "Maira"
    end
    it 'is required' do
      assert_raises(ArgumentError, "#nombre is required"){Contribuyente.new("Maira Diaz", 111)}
    end
    it 'should raise an error for this'do
      assert_raises(StandardError, "#nombre must be a string"){Contribuyente.new(234, "Diaz", 111,222,123456789)}
      #Contribuyente.new(123456, "Diaz", 111,222,333) -> ArgumentError !!!
    end
    it 'should raise an error if it is an empty name'do
      skip  #assert_raises(StandardError, "#nombre wont be an empty name"){}
      #Contribuyente.new("", "Diaz", 111,222,333) -> StandardError !!!!
    end
  end

  describe 'when we asked about the #deuda' do
    it 'should be a number' do
      contribuyente.deuda.must_be_kind_of Numeric
    end
    it 'sholud be zero if the user has no debt' do
      contribuyente = Contribuyente.new("Maira", "Diaz", 111)
      contribuyente.deuda.must_equal 0
    end
    it 'should be consistent' do
      contribuyente.deuda.must_equal 222
    end
    it 'should not be empty'do
      skip "complete"
    end
  end

  describe 'when we asked about the #ingresos ' do
    it 'should be a number'do
      contribuyente.ingresos.must_be_kind_of Numeric
    end
    it 'should return the minimun wage if you do not specify nothing' do
      contribuyente = Contribuyente.new("Maira", "Diaz", 111,222)
      contribuyente.ingresos.must_equal contribuyente.salarioMinimo
    end
    it 'should be consistent' do
      contribuyente.ingresos.must_be_close_to  123456789
    end
    it 'should raise an exception for these two' do
      assert_raises(ArgumentError, "The #ingresos must be a number") {Contribuyente.new("Maira", "Diaz", 111,222,"an string!!")}
      assert_raises(StandardError, "The #ingresos must be greater equal than 2000"){Contribuyente.new("nombre", "apellido", 111,222,200)}
      assert_raises(TypeError, "The #ingresos wont be nil"){Contribuyente.new("Maira", "Diaz", 111,222, nil)}
    end
    it 'should not raise an exception  for limits' do
      minimun=2000
      Contribuyente.new("Maira", "Diaz", 111,222,minimun)
    end
  end

end
