class Team
  @@teams = []
  attr_accessor :name, :wins, :losses, :ties

  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
    @ties = 0
    @@teams << self
  end

  def self.exist?(team_name)
    @@teams.select {|team| team.name.downcase == team_name.downcase}.size > 0
  end

  def self.get_object(team_name)
    # puts "***Team.self.get_object"
    # puts "@@teams: ", @@teams.inspect
    # puts "team_name: ", team_name.inspect

    if @@teams.size > 0
      @@teams.select {|team| team.name.downcase == team_name.downcase}[0]
    end
  end

  def self.all_offspring
    # return all teams created, sorted by wins
    @@teams.sort_by { |team| team.wins }.reverse
  end

  def to_s
    @name
  end
end

