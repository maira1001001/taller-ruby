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
