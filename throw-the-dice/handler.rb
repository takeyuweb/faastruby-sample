require 'securerandom'

FACES = %w{⚀	⚁ ⚂ ⚃ ⚄ ⚅}.freeze

def handler(event)
  number = SecureRandom.random_number(6)
  render text: FACES[number]
end
