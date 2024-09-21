```md
# Diferencia entre `puts` y `print` en Ruby

En Ruby, tanto `puts` como `print` se utilizan para mostrar información en la consola, pero existen algunas diferencias clave entre ellos:

### 1. `puts` (Put String)
- **Propósito**: Muestra el valor y agrega automáticamente una nueva línea al final.
- **Uso típico**: Es ideal cuando quieres que el texto o resultado se imprima seguido de un salto de línea.
- **Comportamiento**: Después de ejecutar `puts`, el cursor de la consola se mueve a la siguiente línea.
  
  ```ruby
  puts "Hola"
  puts "Mundo"
  ```

  **Salida**:
  ```
  Hola
  Mundo
  ```

### 2. `print`
- **Propósito**: Muestra el valor sin agregar una nueva línea automáticamente.
- **Uso típico**: Útil cuando deseas imprimir múltiples valores en una misma línea o cuando quieres controlar manualmente el formato de salida.
- **Comportamiento**: Después de ejecutar `print`, el cursor de la consola permanece en la misma línea.

  ```ruby
  print "Hola"
  print "Mundo"
  ```

  **Salida**:
  ```
  HolaMundo
  ```

### Diferencia clave
- `puts` añade un salto de línea al final de la salida.
- `print` no añade un salto de línea, por lo que la salida se imprime de forma continua.

---

# Construcción de un Objeto en Ruby

Ruby es un lenguaje de programación orientado a objetos, lo que significa que casi todo en Ruby es un objeto. Para crear un objeto, primero se debe definir una clase, y luego puedes instanciar (crear) objetos a partir de esa clase.

### 1. Definición de una Clase

Una clase en Ruby se define con la palabra clave `class`, seguida por el nombre de la clase, que por convención empieza con una letra mayúscula. Dentro de la clase se definen atributos y métodos que describen el comportamiento de los objetos que pertenecen a esa clase.

```ruby
class Persona
  # Método constructor (se llama cuando se crea un objeto)
  def initialize(nombre, edad)
    @nombre = nombre   # Atributo nombre
    @edad = edad       # Atributo edad
  end

  # Método para mostrar información
  def presentar
    puts "Hola, mi nombre es #{@nombre} y tengo #{@edad} años."
  end
end
```

### 2. Creación de un Objeto

Para crear un objeto de la clase, utilizamos el método `new` de la clase y pasamos los argumentos que se esperan en el método `initialize`.

```ruby
# Creación de un objeto de la clase Persona
persona = Persona.new("Camilo", 30)

# Llamada al método presentar
persona.presentar
```

**Salida**:
```
Hola, mi nombre es Camilo y tengo 30 años.
```

### 3. Explicación
- **Clase `Persona`**: Es una plantilla que describe cómo será un objeto de tipo `Persona`.
- **Método `initialize`**: Es un método especial que se ejecuta cuando se crea una instancia (objeto) de la clase. Se utiliza para inicializar los atributos del objeto.
- **Atributos**: Son las variables de instancia (`@nombre` y `@edad`), que pertenecen a cada objeto creado a partir de la clase.
- **Instancia del objeto**: `persona` es una instancia (un objeto) de la clase `Persona`.

Con esto, podemos entender cómo crear clases y objetos en Ruby, así como la diferencia fundamental entre `puts` y `print`.
```