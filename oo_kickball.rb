load 'team.rb'
load 'game.rb'

def get_game_data_from_user
  puts ""
  stats = []
  (1..2).each do |i|
    stat = {}
    loop do
      print "What was team #{i}'s name?\n> "
      stat[:team] = gets.chomp
      print "What was team #{i}'s score?\n> "
      stat[:score] = gets.chomp.to_i


      if stats.size == 0
        stats << stat
        break
      elsif stats.size > 0 and stats.first[:team] != stat[:team]
        stats << stat
        Game.new(stats)
        break
      elsif stats.size > 0 and stats.first[:team] != stat[:team]
        puts "\nThe team name '#{stat[:team]}' has already been used!"
      end
    end
  end
end

# input data
loop do
  get_game_data_from_user
  print "\nWould you like to provide another game? (Y/N)\n> "
  response = gets.chomp.upcase
  break if response == 'N'
end

# print victors
puts ""
games = Game.all_offspring
games.each_with_index do |game, i|
  puts "In game #{i+1}, #{game.winner} is the victor!"
end

# print league standings
puts "\n*** League Standings ***"
teams = Team.all_offspring
teams.each_with_index do |team, i|
  puts "#{i+1} #{team.name}: #{team.wins}W, #{team.losses}L"
end

#
