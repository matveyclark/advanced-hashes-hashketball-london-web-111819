require 'pry'

def game_hash 
  game = {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => [
          {
            :player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
          {
            :player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          }, 
          {
            :player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          {
            :player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          {
            :player_name => "Jason Terry",
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }
        ]
    },
    :away => {
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players => [
          {
            :player_name => "Jeff Adrien",
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
          {
            :player_name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10	
          }, 
          {
            :player_name => "DeSagna Diop",
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5	
          },
          {
            :player_name => "Ben Gordon",
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
          {
            :player_name => "Kemba Walker",
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          }
        ]
    }
  }
end

def num_points_scored(player)
  hash = game_hash
  hash.each do |location|
    location[1][:players].each do |players|
      if players[:player_name] == player
        return players[:points]
      end
    end
  end
end

def shoe_size(player)
  hash = game_hash
  hash.each do |location|
    location[1][:players].each do |players|
      if players[:player_name] == player
        return players[:shoe]
      end
    end
  end
end

def team_colors(team)
  hash = game_hash
  hash.each do |location|
    if location[1][:team_name] == team
      return location[1][:colors]
    end
  end
end

def team_names
  hash = game_hash
  names = []
  hash.each do |location|
    names.push(location[1][:team_name])
  end
  names
end

def player_numbers(team)
  hash = game_hash
  numbers = []
  hash.each do |location|
    if location[1][:team_name] == team
      location[1][:players].each do |player|
      numbers.push(player[:number])
      end
    end
  end
  numbers
end

def player_stats(player)
  hash = game_hash
  result = {}
  hash.each do |location|
    location[1][:players].each do |players|
      if players[:player_name] == player
        result = players.reject do |key, value|
         value == player
        end
      end
    end
  end
  result
end

def big_shoe_rebounds
  hash = game_hash
  shoes = []
  hash.each do |location|
    location[1][:players].each do |player|
      shoes.push(player[:shoe])
    end
  end
  hash.each do |location|
     location[1][:players].each do |player|
        if shoes.max == player[:shoe]
          return player[:rebounds]
        end
    end
  end
end

def most_points_scored
  hash = game_hash
  scores = []
  hash.each do |location|
    location[1][:players].each do |player|
      scores.push(player[:points])
    end
  end
  hash.each do |location|
    location[1][:players].each do |player|
       if scores.max == player[:points]
         return player[:player_name]
       end
   end
 end
end

def winning_team
  hash = game_hash
  team_one = 0
  team_two = 0
  hash[:home][:players].each do |home_player|
    team_one += home_player[:points]
  end
  hash[:away][:players].each do |away_player|
    team_two += away_player[:points]
  end
  if team_one > team_two
    "#{hash[:home][:team_name]}"
  else
    "#{hash[:away][:team_name]}"
  end
end

def player_with_longest_name
  hash = game_hash
  names = []
  hash.each do |location|
    location[1][:players].each do |player|
      names.push(player[:player_name])
    end
  end
  names.max_by(&:length)
end

def long_name_steals_a_ton?
  target = player_with_longest_name
  hash = game_hash
  steals = []
  hash.each do |location|
    location[1][:players].each do |player|
      steals.push(player[:steals])
    end
  end
  hash.each do |location|
    location[1][:players].each do |player|
      if player[:player_name] == target
        if player[:steals] == steals.max
          return true
        end
      end
    end
  end
end












