def get_scores
  scores = {}
  puts ""
  (1..2).each do |i|
    loop do
      print "What was team #{i}'s name?\n> "
      team_name = gets.chomp
      print "What was team #{i}'s score?\n> "
      score = gets.chomp.to_i

      if !scores.keys.include?(team_name)
        scores[team_name] = score
        break
      else
        puts "\nThe team name '#{team_name}' has already been used!"
      end
    end
  end
  scores
end

def identify_winner(scores)
  scores.sort_by { |team, score| score }.last[0]
end

# loop for entering games
games = []
puts ""
loop do
  games << get_scores
  print "\nWould you like to provide another game? (Y/N)\n> "
  response = gets.chomp.upcase
  break if response == 'N'
end

# print out winners, create win/loss record
win_loss_record = {}
games.each_with_index do |game, i|
  victor = identify_winner(game)
  puts "In game #{i+1}, #{victor} is the victor!"

  game.each do |team, score|
    win_loss_record[team] = {w:0, l:0} unless win_loss_record.keys.include?(team)

    if team == victor
      win_loss_record[team][:w] += 1
    else
      win_loss_record[team][:l] += 1
    end
  end
end

p win_loss_record
#sorted_records = win_loss_record.sort_by { |team, win_loss| win_loss[:w] }.to_h
#p sorted_records

# games.each do |game|

# end
