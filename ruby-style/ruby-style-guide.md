#The Ruby Style Guide

##Estructura del Código Fuente

Una clase sin cuerpo

```Ruby
  # bad
  class FooError < StandardError
  end

  # okish
  class FooError < StandardError; end

  ```
Métodos de una sola línea

  ```Ruby
  # mal
  def too_much; something; something_else; end

  # casi bien - el primer ; es necesario
  def no_braces_method; body end

  # casi bien - el segundo ; es opcional
  def no_braces_method; body; end

  # casi bien - la sintaxis es válida, pero al no usar ; hace que sea un poco difícil de leer
  def some_method() body end

  # bien
  def some_method
    body
  end

  ```
  Una excepción a la regla son los métodos vacios
  
 ```Ruby
  # bien
  def no_op; end
  ```
Indentación

Sentencia `case`

```Ruby
  # mal
  case
    when song.name == 'Misty'
      puts 'Not again!'
    when song.duration > 120
      puts 'Too long!'
    when Time.now.hour > 21
      puts "It's too late"
    else
      song.play
  end

  # bien
  case
  when song.name == 'Misty'
    puts 'Not again!'
  when song.duration > 120
    puts 'Too long!'
  when Time.now.hour > 21
    puts "It's too late"
  else
    song.play
  end
  ```
* Al asignar el resultado de una expresión condicional a una variable, conservá la alineación de su ramificación.
  ```Ruby
  
    # mal - bastante complejo
    kind = case year
    when 1850..1889 then 'Blues'
    when 1890..1909 then 'Ragtime'
    when 1910..1929 then 'New Orleans Jazz'
    when 1930..1939 then 'Swing'
    when 1940..1950 then 'Bebop'
    else 'Jazz'
    end
    
    result = if some_cond
      calc_something
    else
      calc_something_else
    end
    
    # bien - es aparente qué está pasando
    kind = case year
           when 1850..1889 then 'Blues'
           when 1890..1909 then 'Ragtime'
           when 1910..1929 then 'New Orleans Jazz'
           when 1930..1939 then 'Swing'
           when 1940..1950 then 'Bebop'
           else 'Jazz'
           end
    
    result = if some_cond
               calc_something
             else
               calc_something_else
             end
    
    # bien (y con un espacio más eficiente)
    kind =
      case year
      when 1850..1889 then 'Blues'
      when 1890..1909 then 'Ragtime'
      when 1910..1929 then 'New Orleans Jazz'
      when 1930..1939 then 'Swing'
      when 1940..1950 then 'Bebop'
      else 'Jazz'
      end
    
    result =
      if some_cond
        calc_something
      else
        calc_something_else
      end
