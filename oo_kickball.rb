class Game
  @@team_list = []
  attr_reader :team1, :team2, :score1, :score2

  def initialize(team1, score1, team2, score2)
    #if @@team_list.include?(team1)
    @team1 = team1
    @team2 = team2
    @score1 = score1
    @score2 = score2

    if @team1 == winner
      @team1.wins += 1
      @team2.losses += 1
    elsif @team2 == winner
      @team2.wins += 1
      @team1.losses += 1
    else  # tie condition
      @team1.ties += 1
      @team2.ties += 1
    end
  end

  def winner
    if @score1 > @score2
      return @team1
    elsif @score2 > @score1
      return @team2
    else
      return :tie  # shouldn't happen
    end
  end

  def to_s
    "#{winner} is the victor!"
  end
end

class Team
  attr_accessor :name, :wins, :losses, :ties

  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
    @ties = 0
  end

  def ==(other_team)
    @name == other_team.name
  end

  def to_s
    name
  end
end

def get_game_data_from_user
  puts ""
  game = nil
  first_team = nil
  first_score = nil
  (1..2).each do |i|
    loop do
      print "What was team #{i}'s name?\n> "
      team = Team.new(gets.chomp)
      print "What was team #{i}'s score?\n> "
      score = gets.chomp.to_i

      if first_team and first_team != team
        game = Game.new(first_team, first_score, team, score)
        break
      elsif first_team.nil? and first_team != team
        first_team = team
        first_score = score
        break
      elsif first_team == team
        puts "\nThe team name '#{team}' has already been used!"
      end
    end
  end
  return game
end

# input data
games = []
puts ""
loop do
  games << get_game_data_from_user
  print "\nWould you like to provide another game? (Y/N)\n> "
  response = gets.chomp.upcase
  break if response == 'N'
end

puts games
