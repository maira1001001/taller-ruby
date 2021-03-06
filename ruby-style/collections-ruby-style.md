##Ruby Style Guide

## Collections

* Creación de Array y Hash 

Prefiere el uso de la notación para arrays literales y creación de hashes
(excepto que necesites pasar parámetros a sus constructores).

```Ruby
    # mal
    arr = Array.new
    hash = Hash.new

    # bien
    arr = []
    hash = {}
```

* Array de string

Prefiere usar `%w` en lugar de la sintaxis array literal cuando
necesites un array de palabras (strings no-vacías sin espacios ni
caracteres espaciales en cada uno). Aplicá esta regla solo en los arrays
de dos o más elementos.

```Ruby
    # mal
    STATES = ['draft', 'open', 'closed']

    # bien
    STATES = %w(draft open closed)
 ```
* Array de símbolos

Prefiere `%i` en lugar de la sintaxis de array literal cuando
necesites un array de símbolos (y no necesitás mantener compatibilidad
con Ruby 1.9). Aplicá esta regla sólo para arrays con dos o más
elementos.

```Ruby
    # mal
    STATES = [:draft, :open, :closed]

    # bien
    STATES = %i(draft open closed)
```

* Cuando estés accediendo al primer o último elmento de un array, preferí
usar `first` o `last` en lugar de `[0]` o `[-1]`.

* Prefiere símbolos en lugar de strings y hash keys.

    ```Ruby
    # mal
    hash = { 'one' => 1, 'two' => 2, 'three' => 3  }

    # bien
    hash = { one: 1, two: 2, three: 3  }
    ```
* Usa la sintaxis de hash literal cuando tus hash keys sean símbolos.

    ```Ruby
    # mal
    hash = { :one => 1, :two => 2, :three => 3  }

    # bien
    hash = { one: 1, two: 2, three: 3  }
    ```

    ```
