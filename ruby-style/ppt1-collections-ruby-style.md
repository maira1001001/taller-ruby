##Ruby Style Guide

## Collections

* Creación de Array y Hash 

    ```Ruby
    # mal
    arr = Array.new
    hash = Hash.new

    #bien
    arr = []
    hash = {}
    ```

* Array de string

    ```Ruby
    # mal
    STATES = ['draft', 'open', 'closed']
    
    #bien
    STATES = %w(draft open closed)
    ```
* Array de símbolos

```Ruby
    # mal
    STATES = [:draft, :open, :closed]

    # bien
    STATES = %i(draft open closed)
```

* Cuando estés accediendo al primer o último elmento de un array, preferí
usar `first` o `last` en lugar de `[0]` o `[-1]`.

* Símbolos vs string en  hash keys.

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

