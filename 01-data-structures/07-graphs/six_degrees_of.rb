require_relative 'node'

class SixDegreesOf

  def initialize
    @movie_path = []
    @visited_actors = []
  end

  def find_kevin_bacon(starting_node)
    return if starting_node == nil
    return "Kevin Bacon is 0 degrees from himself." if starting_node.name == "Kevin Bacon"
    @visited_actors << starting_node.name
    next_actor = nil
    next_movie = nil

    starting_node.film_actor_hash.each do |movie, actors_array|
      actors_array.each do |actor|
        return @movie_path << movie if actor.name == "Kevin Bacon"
        unless @visited_actors.include?(actor.name)
          next_actor = actor
        end
      end

      unless @movie_path.include?(movie)
        next_movie = movie
      end
    end

    pp @movie_path.size
    if @movie_path.size > 6
      return "This actor is more than six degrees of separation from Kevin Bacon."
    end

    @movie_path << next_movie
    find_kevin_bacon(next_actor)

    @movie_path.compact
  end
end
