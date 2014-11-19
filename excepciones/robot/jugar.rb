class Robot
  def atacar(object)
    object.recibir_ataque
  rescue StandardError => e
    e.message
  end

  def recibir_ataque
    "Reci ataque de un robot"
  end

  def tirar_pilas(place)
    
  end
end

class Humano
  def recibir_ataque
    raise StandardError.new("Un robot debe obedecer las órdenes dadas por los seres humanos")
  end
end

robot1=Robot.new
robot2=Robot.new
human=Humano.new
p robot1.atacar robot2
p robot1.atacar human

