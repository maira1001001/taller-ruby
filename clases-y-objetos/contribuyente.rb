class Contribuyente

  attr_accessor :nombre, :apellido, :cuit, :deuda, :ingresos

  def initialize(nombre, apellido, cuit, deuda=0, ingresos=self.salarioMinimo)
    @nombre = validate_nombre(nombre)
    @apellido = validate_apellido(apellido)
    @deuda = validate_deuda(deuda)
    @cuit = validate_cuit(cuit)
    @ingresos = validate_ingresos(ingresos)
  end


  def salarioMinimo
    2000
  end

  private

    def validate_nombre(nombre)
      str_nombre = String(nombre)
      unless str_nombre =~ /\d/
       @nombre=str_nombre
      else
        raise StandardError, "El nombre #{str_nombre} contiene un numero. No es un apellido correcto"
      end
    end

    def validate_apellido(apellido)
      str_apellido = String(apellido)
      unless str_apellido =~ /\d/
        @apellido = str_apellido
      else
        raise StandarError, "El apellido #{str_apellido} contiene un numero. No es un apellido correct"
      end
    end

    def validate_cuit(cuit)
      #hay que ver con expresiones regulares: xx-yyyyyyyy-z
    end

    def validate_deuda(deuda)
      Float(deuda)
    end

    def validate_ingresos(ingresos)
      num_ingresos = Float(ingresos)
      if num_ingresos >= salarioMinimo
        num_ingresos
      else
        raise StandardError.new("Los ingresos deben ser mayor o igual que el salario mínimo")
      end
    end

end

#p Contribuyente.new("Maira","Diaz","123456789", nil)
p Contribuyente.new("Nombre", "Apellido", "32323232", 122112, 323232)
p Contribuyente.new("Agustin", "Diaz", "36123321", 22222, 32323232)
#p Contribuyente.new(111,222,333,444,555)
