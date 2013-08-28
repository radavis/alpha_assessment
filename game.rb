class Game
  @@games = []
  attr_reader :winner
  def initialize(stats)
    # stats is an array of two {:team => 'Sick Kicks', :score => 5} items
    @stats = stats

    # puts "***Game.initialize"
    # puts "@stats: ", @stats.inspect

    # create team objects if necessary
    @stats.each do |stat|
      if !Team.exist?(stat[:team])
        Team.new(stat[:team])
      end
    end

    # update w/l history
    if stats.first[:score] > stats.last[:score]
      puts "stats.first[:name]: ", stats.first[:team].inspect
      @winner = Team.get_object(stats.first[:team])
      @winner.wins += 1
      Team.get_object(stats.last[:team]).losses += 1

    elsif stats.first[:score] < stats.last[:score]
      Team.get_object(stats.first[:team]).losses += 1
      @winner = Team.get_object(stats.last[:team])
      @winner.wins += 1

    else
      Team.get_object(stats.first[:team]).ties += 1
      Team.get_object(stats.last[:name]).ties += 1
    end

    @@games << self
  end

  def self.all_offspring
    @@games
  end
end
