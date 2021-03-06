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
        if !@visited_actors.include?(actor.name) && !@movie_path.include?(movie)
          next_actor = actor
          next_movie = movie
          break
        end
      end
    end

    @movie_path << next_movie unless next_movie.nil?
    find_kevin_bacon(next_actor)
    if @movie_path.size > 6
      return "This actor has more than six degrees of separation from Kevin Bacon."
    end

    @movie_path
  end
end
