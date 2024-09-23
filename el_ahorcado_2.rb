# frozen_string_literal: true

# Definir un array con palabras para adivinar
palabras = %w[jonico dorico frigio lidio mixolidio eolio locrio]

intentos = 6 # Número de intentos permitidos
palabra_seleccionada = palabras.sample.split('') # Convertir la palabra a un array de letras
letras_adivinadas = []
palabra_oculta = ['_'] * palabra_seleccionada.length # La palabra oculta empieza con guiones bajos

# Definir la clase Juego
class Juego
  def self.iniciar(palabra_seleccionada, intentos, letras_adivinadas, palabra_oculta)
    loop do
      mostrar_estado(palabra_oculta, intentos, letras_adivinadas, palabra_seleccionada)
      letra = pedir_letra(letras_adivinadas)

      procesar_letra(letra, palabra_seleccionada, palabra_oculta, letras_adivinadas)

      intentos = actualizar_intentos(letra, palabra_seleccionada, intentos)

      break if juego_terminado?(palabra_oculta, palabra_seleccionada, intentos)
    end
  end

  def self.mostrar_estado(palabra_oculta, intentos, letras_adivinadas, palabra_seleccionada)
    puts "\nPalabra: #{palabra_oculta.join(' ')}"
    puts "Intentos restantes: #{intentos}"
    puts "Letras adivinadas: #{letras_adivinadas.join(', ')}"
    puts "La palabra a adivinar tiene #{palabra_seleccionada.length} letras."
  end

  def self.pedir_letra(letras_adivinadas)
    print 'Adivina una letra: '
    letra = gets.chomp.downcase
    validar_letra_repetida(letra, letras_adivinadas)
  end

  def self.validar_letra_repetida(letra, letras_adivinadas)
    if letras_adivinadas.include?(letra)
      puts "Ya adivinaste la letra '#{letra}'. Intenta con otra."
      pedir_letra(letras_adivinadas)
    else
      letra
    end
  end

  def self.procesar_letra(letra, palabra_seleccionada, palabra_oculta, letras_adivinadas)
    letras_adivinadas << letra
    if palabra_seleccionada.include?(letra)
      reemplazar_guiones(letra, palabra_seleccionada, palabra_oculta)
      puts "¡Bien! La letra '#{letra}' está en la palabra."
    else
      puts "La letra '#{letra}' no está en la palabra."
    end
  end

  def self.reemplazar_guiones(letra, palabra_seleccionada, palabra_oculta)
    palabra_seleccionada.each_with_index do |letra_palabra, indice|
      palabra_oculta[indice] = letra if letra_palabra == letra
    end
  end

  def self.actualizar_intentos(letra, palabra_seleccionada, intentos)
    intentos -= 1 unless palabra_seleccionada.include?(letra)
    intentos
  end

  def self.juego_terminado?(palabra_oculta, palabra_seleccionada, intentos)
    if palabra_oculta == palabra_seleccionada
      puts "¡Felicidades! Adivinaste la palabra: #{palabra_oculta.join}"
      true
    elsif intentos.zero?
      puts "¡Lo siento! Te quedaste sin intentos. La palabra era: #{palabra_seleccionada.join}"
      true
    else
      false
    end
  end
end

# Iniciar el juego
Juego.iniciar(palabra_seleccionada, intentos, letras_adivinadas, palabra_oculta)
