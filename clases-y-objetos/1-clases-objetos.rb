






class Contribuyente

  attr_accessor :nombre, :apellido, :cuit, :deuda, :ingresos

  def initialize(nombre, apellido, cuit, deuda=0, ingresos= self.salarioMinimo)
    @nombre=nombre
    @apellido=apellido
    @cuit=cuit
    @deuda=deuda
    @ingresos=ingresos
  end
  
  def salarioMinimo
    8000
  end
end

p Contribuyente.new("albert","einstein", 737373).inspect
