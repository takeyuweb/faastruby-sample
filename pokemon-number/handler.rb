require 'json'
JSON_PATH = File.expand_path(File.join('pokemon_data', 'data', 'pokemon_data.json'), File.dirname(__FILE__)).freeze
POKEMON_DATA = JSON.load(File.read(JSON_PATH)).freeze

def handler(event)
  post_data = JSON.parse(event.body)

  pokemon = POKEMON_DATA.find { |data| data["no"].to_i == post_data["text"].to_i }

  if pokemon
    render text: pokemon["name"]
  else
    render text: "けつばん"
  end
end
