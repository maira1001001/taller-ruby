#The Ruby Style Guide

##Estructura del Código Fuente

* Una clase sin cuerpo

```Ruby
  # bad
  class FooError < StandardError
  end

  # okish
  class FooError < StandardError; end

  ```
* Métodos de una sola línea

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
 * Una excepción a la regla son los métodos vacios
  
 ```Ruby
  # bien
  def no_op; end
  ```
* Indentación

* Sentencia `case`

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
  ```
  
* Usa espacios alrededor del operador `=` cuando asignes valores predeterminados a los
  parámetros del método:

    ```Ruby
    # mal
    def some_method(arg1=:default, arg2=nil, arg3=[])
      # do something...
    end

    # bien
    def some_method(arg1 = :default, arg2 = nil, arg3 = [])
      # do something...
    end
    ```
* Al continuar una invocación de método encadenado en otra línea mantener el `.` en la segunda línea.

    ```Ruby
    # mal - es necesario leer la primer línea para entender la segunda línea
    one.two.three.
      four

    # bien - inmediatamente se ve qué está pasando en la segunda línea
    one.two.three
      .four
    ```
* Alinea los parámetros de una llamada a un método si ocupan más de una
  línea. Cuando se alinean los parámetros no es apropiado que sea con
  más indentación de lo debido, y utilizar un indentado único para las
  líneas luego del primer parámetro también es aceptable.

    ```Ruby
    # punto de partida (la línea es muy larga)
    def send_mail(source)
      Mailer.deliver(to: 'bob@example.com', from: 'us@example.com', subject: 'Important message', body: source.text)
    end

    # mal (doble indentado)
    def send_mail(source)
      Mailer.deliver(
          to: 'bob@example.com',
          from: 'us@example.com',
          subject: 'Important message',
          body: source.text)
    end

    # bien
    def send_mail(source)
      Mailer.deliver(to: 'bob@example.com',
                     from: 'us@example.com',
                     subject: 'Important message',
                     body: source.text)
    end

    # bien (indentado normal)
    def send_mail(source)
      Mailer.deliver(
        to: 'bob@example.com',
        from: 'us@example.com',
        subject: 'Important message',
        body: source.text
      )
    end
    ```

* Alinea los elementos de arrays literales que ocupen múltiples líneas.

    ```Ruby
    # mal - indentado simple
    menu_item = ["Spam", "Spam", "Spam", "Spam", "Spam", "Spam", "Spam", "Spam",
      "Baked beans", "Spam", "Spam", "Spam", "Spam", "Spam"]

    # bien
    menu_item = [
      "Spam", "Spam", "Spam", "Spam", "Spam", "Spam", "Spam", "Spam",
      "Baked beans", "Spam", "Spam", "Spam", "Spam", "Spam"
    ]

    # bien
    menu_item =
      ["Spam", "Spam", "Spam", "Spam", "Spam", "Spam", "Spam", "Spam",
       "Baked beans", "Spam", "Spam", "Spam", "Spam", "Spam"]
    ```

* Agrega guiones bajos para números literales grandes para mejorar su lectura.

    ```Ruby
    # mal - cuantos 0s hay ahi?
    num = 1000000

    # bien - mucho más fácil de leer por el cerebro humano
    num = 1_000_000
    ```
* Limitá las líneas a 80 caracteres.
* Evita los espacios en blanco.
* No uses los comentarios de bloque. Ellos no pueden tener espacios en blanco
  antes y no son tan fáciles de entenderlos como comentarios.

    ```Ruby
    # mal
    == begin
    comment line
    another comment line
    == end

    # bien
    # comment line
    # another comment line
    ```
