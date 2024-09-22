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
      # Mostrar estado actual
      puts "\nPalabra: #{palabra_oculta.join(' ')}"
      puts "Intentos restantes: #{intentos}"
      puts "Letras adivinadas: #{letras_adivinadas.join(', ')}"
      puts "La palabra a adivinar tiene #{palabra_seleccionada.length} letras."

      # Pedir al jugador que adivine una letra
      print 'Adivina una letra: '
      letra = gets.chomp.downcase

      # Verificar si ya se adivinó esa letra
      if letras_adivinadas.include?(letra)
        puts "Ya adivinaste la letra '#{letra}'. Intenta con otra."
        next
      end

      # Añadir la letra a las letras adivinadas
      letras_adivinadas << letra

      # Verificar si la letra está en la palabra
      if palabra_seleccionada.include?(letra)
        # Reemplazar los guiones bajos en las posiciones correctas
        palabra_seleccionada.each_with_index do |letra_palabra, indice|
          palabra_oculta[indice] = letra if letra_palabra == letra
        end
        puts "¡Bien! La letra '#{letra}' está en la palabra."
      else
        intentos -= 1
        puts "La letra '#{letra}' no está en la palabra."
      end

      # Verificar si se ganó el juego
      if palabra_oculta == palabra_seleccionada
        puts "¡Felicidades! Adivinaste la palabra: #{palabra_oculta.join}"
        break
      end

      # Verificar si se quedaron sin intentos
      next unless intentos.zero?

      puts '¡Lo siento! Te quedaste sin intentos.'
      puts " La palabra era: #{palabra_seleccionada.join}"
      break
    end
  end
end

# Iniciar el juego
Juego.iniciar(palabra_seleccionada, intentos, letras_adivinadas, palabra_oculta)
