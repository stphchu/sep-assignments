require_relative 'node'

class SixDegreesOf
  attr_accessor :visited_actors

  def initialize
    @visited_actors = []
  end

  def find_kevin_bacon(starting_node)
    movie_path = []
    # return if starting_node == nil
    @visited_actors << starting_node.name
    # if starting_node.name == "Kevin Bacon"
    #   return "Kevin Bacon is 0 degrees from himself."
    # end

    starting_node.film_actor_hash.each do |movie, actors_array|
      actors_array.each do |actor|
        if actor.name == "Kevin Bacon"
          movie_path << movie
        end
        if !@visited_actors.include?(actor.name)
          find_kevin_bacon(actor)
          movie_path << movie
        end
      end
    end

    if movie_path.uniq.size > 6
      return "This actor is more than six degrees of separation from Kevin Bacon."
    end

  #   movie = next_movie(starting_node)
  #
  #   if movie == nil
  #     return "Kevin Bacon cannot be found."
  #   else
  #     actor = starting_node.film_actor_hash[movie].first
  #     find_kevin_bacon(actor)
  #   end
  # end

    # def find_next_movie(actor)
    #   actor.film_actor_hash.keys.each do |movie|
    #     return movie unless @movie_path.include?(movie)
    #   end
    # end
    movie_path.uniq
  end
end
