#The Ruby Style Guide

##Nombres

* Símbolos, métodos y variables: `snake_case` 

    ```Ruby
    # mal
    :'some symbol'
    :SomeSymbol
    :someSymbol

    someVar = 5

    def someMethod
      ...
    end

    def SomeMethod
     ...
    end

    # bien
    :some_symbol

    def some_method
      ...
    end
    ```
    
    

* Nombre de Clases:  `CamelCase` 

(Mantené en mayúsculas los acrónimos como HTTP, RFC, XML.)

    ```Ruby
    # mal
    class Someclass
      ...
    end

    class Some_Class
      ...
    end

    class SomeXml
      ...
    end

    # bien
    class SomeClass
      ...
    end

    class SomeXML
      ...
    end
    ```

* Constantes: `SCREAMING_SNAKE_CASE`

    ```Ruby
    # mal
    SomeConst = 5

    # bien
    SOME_CONST = 5
    ```

* Métodos que devuelven booleano: deben terminar con un signo de pregunta `?`
  
ejemplo: `Array#empty?`

* Métodos potencialmente peligrosos: deben terminar con un signo de exclamación `!` 

http://ruby-doc.org/core-2.2.0/String.html

