#The Ruby Style Guide

##Sintaxis

* Usa `def` con paréntesis cuando tengas argumentos. Omite los
  paréntesis cuando el método no acepta ningún argumento.

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

