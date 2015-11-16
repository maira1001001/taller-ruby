#The Ruby Style Guide

##Extra styles


* Usa `||=` libremente para inicializar variables.

    ```Ruby
    # set name to Bozhidar, only if it's nil or false
    name ||= 'Bozhidar'
    ```

* No uses `||=` para inicializar variables booleanas. (Considera qué
pasaría si el valor actual fuese `false`.)

    ```Ruby
    # mal - asignaría true a enabled aunque ya era false
    enabled ||= true

    # bien
    enabled = true if enabled.nil?
    ```
