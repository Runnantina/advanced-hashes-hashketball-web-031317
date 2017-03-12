# Write your code here!

def game_hash
  game_hash = {
    :home => {
      :team_name =>"Brooklyn Nets",
      :colors =>["Black", "White"] ,
      :players => [
        { :player_name=> "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        { :player_name=> "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        { :player_name=> "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        { :player_name=> "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        { :player_name=> "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1},
      ]
    },
    :away => {
      :team_name =>"Charlotte Hornets",
      :colors =>["Turquoise", "Purple"],
      :players => [
        { :player_name=> "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        { :player_name=> "Bismak Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        { :player_name=> "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        { :player_name=> "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        { :player_name=> "Brendan Haywood", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
        ]
    }
  }

end

def num_points_scored(player)
  score = find_player(player).fetch(:points)
end

def team_colors(team)
  colors = find_team(team).fetch(:colors)
end

def team_names
  home_team = game_hash[:home][:team_name]
  away_team = game_hash[:away][:team_name]
  team_names = [home_team, away_team]
  team_names
end

def player_numbers(team_name)
  find_team(team_name)[:players].map do |player_jerseys|
    player_jerseys[:number]
  end
end

def player_stats(name)
  find_player(name).reject {|key, value| key == :player_name }

end

def shoe_size(name)
  player_info = find_player(name).fetch(:shoe)
end

def big_shoe_rebounds
  biggest_shoe_size = all_players.sort_by {|player| player.fetch(:shoe)}.last
  big_shoe_rebounds_player = biggest_shoe_size
  big_shoe_rebounds_player.fetch(:rebounds)
end

#######################

# consolidate all 'players' variable together
def all_players
  home_team = game_hash.fetch(:home).fetch(:players)
  away_team = game_hash.fetch(:away).fetch(:players)
  return home_team + away_team
end

# method to narrow down all attributes of a specific team
def find_team(team_name)
  teams.find {|team| team_name == team.fetch(:team_name)}
end

# method to narrow down a specific player's attributes
def find_player(name)
  all_players.find {|player| name == player.fetch(:player_name)}
end

def teams
  game_hash.values
end
