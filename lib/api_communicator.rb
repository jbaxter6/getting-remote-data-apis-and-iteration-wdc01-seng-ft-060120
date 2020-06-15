require 'rest-client'
require 'json'
require 'pry'

def get_json
  response_string = RestClient.get('http://swapi.dev/api/people')
  response_hash = JSON.parse(response_string)
end

def character_match(character_name)
  get_json["results"].find do |character|
    character["name"] == character_name
  end
end

def characters_movie(char_match)
  char_match["films"].map do |url|
    film_request = RestClient.get(url)
    film_json = JSON.parse(film_request)
  end
end

def get_character_movies_from_api(character_name)
    character_object = character_match(character_name)
    film_info = characters_movie(character_object)
    film_info
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
    films.each do |film|
      puts film["title"]
    end
    # binding.pry
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
