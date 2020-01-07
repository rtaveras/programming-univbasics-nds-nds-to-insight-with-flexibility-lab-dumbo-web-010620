            # Provided, don't edit
require 'directors_database'
require 'pry'


def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end


def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end



def movies_with_director_key(name, movies_collection)
  new_array = []
  x = 0 
  while x < movies_collection.length do
    new_array << movie_with_director_name(name, movies_collection[x])
    x += 1
  end
    return new_array
  
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
end


def gross_per_studio(collection)
  hash = {}
  i = 0
  while i < collection.length
    if hash[collection[i][:studio]] == nil
     hash[collection[i][:studio]] = collection[i][:worldwide_gross]
  else 
    hash[collection[i][:studio]] += collection[i][:worldwide_gross]
  end
  i += 1
end
  return hash
end


def movies_with_directors_set(source)
  new_array = []
  i = 0 
  while i < source.length do 
    new_hash = {}
    new_hash[source[i][:name]] = source[i][:movies]
    i += 1 
    new_array << new_hash
  end
  return new_array
  
  
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
