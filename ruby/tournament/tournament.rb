class Team
  attr_accessor :name, :wins, :draws, :losses

  def initialize(name)
    @name = name
    @wins = 0
    @draws = 0
    @losses = 0
  end

  def points
    wins * 3 + draws
  end

  def played
    wins + draws + losses
  end
end

class TournamentPrinter
  def self.print(teams)
    new(teams).print
  end

  def print
    print_header + print_teams
  end

  def initialize(teams)
    @teams = teams
  end

  private

  attr_accessor :teams

  def print_header
    "Team                           | MP |  W |  D |  L |  P\n"
  end

  def print_teams
    teams.map(&method(:print_team)).join
  end

  def print_team(team)
    format("%-30s | %2d | %2d | %2d | %2d | %2d\n",
           team.name, team.played, team.wins, team.draws, team.losses, team.points)
  end
end

class Tournament
  def self.tally(results)
    new(results).tally
  end

  def tally
    TournamentPrinter.print(teams)
  end

  def initialize(results)
    @teams = to_teams(results.split("\n"))
  end

  private

  attr_reader :teams

  def to_teams(matches)
    matches
      .each_with_object({}, &method(:process_match))
      .values
      .sort_by { |team| [-team.points, team.name] }
  end

  def process_match(match, teams)
    team1, team2, result = match.split(';')

    teams[team1] = Team.new(team1) unless teams.key?(team1)
    teams[team2] = Team.new(team2) unless teams.key?(team2)

    case result
    when 'loss'
      teams[team1].losses += 1
      teams[team2].wins += 1
    when 'win'
      teams[team1].wins += 1
      teams[team2].losses += 1
    when 'draw'
      teams[team1].draws += 1
      teams[team2].draws += 1
    end
  end
end