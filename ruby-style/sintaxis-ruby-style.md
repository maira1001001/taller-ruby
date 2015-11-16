#The Ruby Style Guide

##Sintaxis

* Usa `def` con paréntesis 

     ```Ruby
     # mal
     def some_method()
       # body omitted
     end

     # bien
     def some_method
       # body omitted
     end

     # mal
     def some_method_with_arguments arg1, arg2
       # body omitted
     end

     # bien
     def some_method_with_arguments(arg1, arg2)
       # body omitted
     end
     ```

* Utiliza los iteradores en vez de `for`. 
`for` se  debe implementar en forma de `each` (asi estás agregando un nivel de
  indirección), pero con una peculiaridad - `for` no introduce un nuevo
  scope (a diferencia de `each`) y las variables que se definen dentro
  de su bloque son visibles fuera del mismo.

    ```Ruby
    arr = [1, 2, 3]

    # mal
    for elem in arr do
      puts elem
    end

    # elem puede ser leída fuera del loop for
    elem #=> 3

    # bien
    arr.each { |elem| puts elem }

    # elem no puede ser leída fuera del bloque each
    elem #=> NameError: undefined local variable or method `elem'
    ```

* Operador ternario (`?:`) en lugar de las construcciones
  `if/then/else/end`

    ```Ruby
    # mal
    result = if some_condition then something else something_else end

    # bien
    result = some_condition ? something : something_else
    ```
* Otro ejemplo del operador ternario

    ```Ruby
    # mal
    some_condition ? (nested_condition ? nested_something : nested_something_else) : something_else

    # bien
    if some_condition
      nested_condition ? nested_something : nested_something_else
    else
      something_else
    end
    ```
*  `if/unless` en una línea.

    ```Ruby
    # mal
    if some_condition
      do_something
    end

    # bien
    do_something if some_condition
    ```
* `unless` por sobre `if`:  para condiciones negativas.

    ```Ruby
    # mal
    do_something if !some_condition

    # mal
    do_something if not some_condition

    # bien
    do_something unless some_condition
    ```

* Nunca uses `unless` con `else`. 
 
Reescribe para que el caso positivo esté primero.

 ```Ruby
    # mal
    unless success?
      puts 'failure'
    else
      puts 'success'
    end

    # bien
    if success?
      puts 'success'
    else
      puts 'failure'
    end
  ```
* No uses paréntesis alrededor de la condición de `if/unless/while/until`.

    ```Ruby
    # mal
    if (x > 10)
      # body omitted
    end

    # bien
    if x > 10
      # body omitted
    end
    ```
* Favorecé el uso del modificador `while/until` cuando puedas escribir la
  comparación en una línea.

    ```Ruby
    # mal
    while some_condition
      do_something
    end

    # bien
    do_something while some_condition
    ```

* Favorecé `until` por sobre `while` para condiciones negativas.

    ```Ruby
    # mal
    do_something while !some_condition

    # bien
    do_something until some_condition
    ```

* Omite tanto las llaves externas como los paréntesis para métodos que formen
  parte de un DSL interno (Rails, Rspec, Rake).

    ```Ruby
    class Person < ActiveRecord::Base
      # mal
      validates(:name, { presence: true, length: { within: 1..10 } })

      # bien
      validates :name, presence: true, length: { within: 1..10 }
    end
    ```
* Omite los paréntesis para llamadas a métodos sin argumentos.

    ```Ruby
    # mal
    Kernel.exit!()
    2.even?()
    fork()
    'test'.upcase()

    # bien
    Kernel.exit!
    2.even?
    fork
    'test'.upcase
    ```
    
    *Bloques de una línea , bloques multilíneas
    
    Elige `{...}` por sobre `do...end` para bloques de una línea. Evita
  el uso de `{...}` para bloques multilíneas (encadenamiento de multilínea
  siempre es horrible). Siempre usá `do...end` para "contorl de flujo" y
  "definiciones de métodos" (e.g. en Rakefiles y algunos DSLs). Evita usar
  `do...end` cuando estés encadenando métodos.

    ```Ruby
    names = ['Bozhidar', 'Steve', 'Sarah']

    # mal
    names.each do |name|
      puts name
    end

    # bien
    names.each { |name| puts name }

    # mal
    names.select do |name|
      name.start_with?('S')
    end.map { |name| name.upcase }

    # bien
    names.select { |name| name.start_with?('S') }.map { |name| name.upcase }
    ```

    Puede ser que algunas personas piensen que el encadenamiento en multilínea se vería bien con
    el uso de {...}, pero en realidad deberían preguntarse a sí mismos - es el código realmente
    legible y los contenidos de los bloques pueden ser extraídos con métodos elegantes?

* control de flujo: `return`

Evita usar `return` cuando no se requiera realizar control de flujo.

```Ruby
    # mal
    def some_method(some_arr)
      return some_arr.size
    end

    # bien
    def some_method(some_arr)
      some_arr.size
    end
```
* `self` : acceso a sí mismo

Evita usar `self` cuando no es necesario. (Solo se necesita cuando se llama a un accesor de escritura propio.)

```Ruby
    # mal
    def ready?
      if self.last_reviewed_at > self.last_updated_at
        self.worker.update(self.content, self.options)
        self.status = :in_progress
      end
      self.status == :verified
    end

    # bien
    def ready?
      if last_reviewed_at > last_updated_at
        worker.update(content, options)
        self.status = :in_progress
      end
      status == :verified
    end
 ```
* Asignación en expresiones condicionales

No uses el valor de retorno de `=` (asignación) en expresiones
condicionales a menos que la asignación se encuentre entre paréntesis.
Esta es una expresión bastante popular entre los Rubyistas que se
refiere a veces como *asignación segura en condiciones*.

```Ruby
    # mal 
    if v = array.grep(/foo/)
      do_something(v)
      ...
    end

    # bien, aunque no es conveniente 
    if (v = array.grep(/foo/))
      do_something(v)
      ...
    end

    # bien
    v = array.grep(/foo/)
    if v
      do_something(v)
      ...
    end
```

* Usa la nueva sintaxis de lambda literal para bloques de una sola línea.
  Usa el método `lambda` para bloques multilínea.

```Ruby
    # mal
    l = lambda { |a, b| a + b }
    l.call(1, 2)

    # correcto, pero se ve extremadamente incómodo
    l = ->(a, b) do
      tmp = a * 7
      tmp * b / 50
    end

    # bien
    l = ->(a, b) { a + b }
    l.call(1, 2)

    l = lambda do |a, b|
      tmp = a * 7
      tmp * b / 50
    end
```

* Elige `proc` por sobre `Proc.new`.

    ```Ruby
    # mal
    p = Proc.new { |n| puts n }

    # bien
    p = proc { |n| puts n }
    ```

* Elige `proc.call()` por sobre `proc[]` o `proc.()` tanto para lambdas y procs.

    ```Ruby
    # mal - se ve similar a un acceso de Enumeración
    l = ->(v) { puts v }
    l[1]


    # también mal - sintaxis no común
    l = ->(v) { puts v }
    l.(1)

    # bien
    l = ->(v) { puts v }
    l.call(1)
    ```

* Usa rangos o `Comparable#between?` en lugar de una comparación lógica
  compleja cuando sea posible.

    ```Ruby
    # mal
    do_something if x >= 1000 && x <= 2000

    # bien
    do_something if (1000..2000).include?(x)

    # bien
    do_something if x.between?(1000, 2000)
    ```

* Un poco de sentido común... y dejando de lado lo antiguo

  Elige el uso de métodos subyacentes en lugar de las comparaciones
  explícitas con `==`. Comparaciones numéricas están OK.

    ```Ruby
    # mal
    if x % 2 == 0
    end

    if x % 2 == 1
    end

    if x == nil
    end

    # bien
    if x.even?
    end

    if x.odd?
    end

    if x.nil?
    end

    if x.zero?
    end

    if x == 0
    end
    ```



* If anidados vs return 

Evita el uso de condicionales anidados para control de flujo.
Elige una cláusula de guardia (guard clause) cuando puedas afirmar datos inválidos.
Una cláusula de guardia es un condicional al principio de una función que trata de
salir de ella tan pronto como pueda.

```Ruby
    # mal
      def compute_thing(thing)
        if thing[:foo]
          update_with_bar(thing)
          if thing[:foo][:bar]
            partial_compute(thing)
          else
            re_compute(thing)
          end
        end
      end

    # bien
      def compute_thing(thing)
        return unless thing[:foo]
        update_with_bar(thing[:foo])
        return re_compute(thing) unless thing[:foo][:bar]
        partial_compute(thing)
      end
```















