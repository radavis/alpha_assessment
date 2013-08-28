def get_scores
  scores = {}
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
        puts "The team name '#{team_name}'' has already been used!"
      end
    end
  end
  scores
end

def identify_winner(scores)
  scores.sort_by { |name, score| score }.last[0]
end


victor = identify_winner(get_scores)
puts "#{victor} is the Victor!"
