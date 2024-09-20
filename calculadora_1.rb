# Clase que representa la calculadora
class Calculator
  # Método para iniciar la calculadora
  def start
    loop do
      # Obtiene los números
      number1 = get_number("Ingresa el primer número: ")
      number2 = get_number("Ingresa el segundo número: ")

      # Elige la operación
      operation = choose_operation

      # Realiza la operación
      perform_operation(number1, number2, operation)

      # Pregunta al usuario si quiere continuar
      puts "¿Quieres hacer otro cálculo? (sí/no)"
      continue = gets.chomp.downcase
      break unless continue == "sí" || continue == "si"
    end
    puts "¡Gracias por usar la calculadora!"
  end

  private

  # Método que obtiene un número del usuario y lo valida
  def get_number(prompt)
    print prompt
    input = gets.chomp
    if input.match(/^\d*\.?\d+$/)
      input.to_f
    else
      puts "Error: '#{input}' no es un número válido. Intenta de nuevo."
      get_number(prompt)
    end
  end

  # Método para elegir la operación
  def choose_operation
    puts "Elige una operación:"
    puts "1. Sumar"
    puts "2. Restar"
    puts "3. Multiplicar"
    puts "4. Dividir"
    print "Opción: "
    gets.chomp.to_i
  end

  # Método que realiza la operación basada en la elección
  def perform_operation(num1, num2, operation)
    case operation
    when 1
      result = num1 + num2
      puts "El resultado de sumar #{num1} y #{num2} es #{result}"
    when 2
      result = num1 - num2
      puts "El resultado de restar #{num1} y #{num2} es #{result}"
    when 3
      result = num1 * num2
      puts "El resultado de multiplicar #{num1} y #{num2} es #{result}"
    when 4
      if num2 == 0
        puts "Error: No se puede dividir entre cero."
      else
        result = num1 / num2
        puts "El resultado de dividir #{num1} entre #{num2} es #{result}"
      end
    else
      puts "Operación no válida. Intenta de nuevo."
    end
  end
end

# Crea una instancia de la clase Calculator y llama al método start para iniciar el programa
calculator = Calculator.new
calculator.start
