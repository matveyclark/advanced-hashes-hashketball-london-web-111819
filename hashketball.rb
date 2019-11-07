require 'pry'

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
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
        {:player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7},
          
          {:player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15},
          
          {:player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5},
          
           {:player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1}
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
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
        {:player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10},
          
          {:player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5},
          
          {:player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0},
          
          {:player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12}
        ]
    }
  }
end

def num_points_scored(player_name)
  points = 0
  game_hash.each do |location|
    location[1][:players].each do |player|
      if player[:player_name] == player_name
        points = player[:points]
      end
    end
  end
  points
end

def shoe_size(player_name)
  shoes = 0
  game_hash.each do |location|
    location[1][:players].each do |player|
      if player[:player_name] == player_name
        shoes = player[:shoe]
      end
    end
  end
  shoes
end

def team_colors(team_name)
  colors = []
  game_hash.each do |location|
    if location[1][:team_name] == team_name
      colors = location[1][:colors]
    end
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |location|
    teams.push(location[1][:team_name])
  end
  teams
end
   

def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |location|
    if location[1][:team_name] == team
      location[1][:players].each do |player|
        jersey_numbers.push(player[:number])
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  result = {}
  game_hash.each do |location|
    location[1][:players].each do |player|
      if player[:player_name] == player_name
        result[:number] = player[:number]
        result[:shoe] = player[:shoe]
        result[:points] = player[:points]
        result[:rebounds] = player[:rebounds]
        result[:assists] = player[:assists]
        result[:steals] = player[:steals]
        result[:blocks] = player[:blocks]
        result[:slam_dunks] = player[:slam_dunks]
      end
    end
  end
  result
end

def big_shoe_rebounds
  shoe_sizes = []
  game_hash.each do |location|
    location[1][:players].each do |player|
      shoe_sizes.push(player[:shoe])
    end
  end
  game_hash.each do |location|
    location[1][:players].each do |player|
      if shoe_sizes.max == player[:shoe]
        return player[:rebounds]
      end
    end
  end
end

def most_points_scored
  points = []
  game_hash.each do |location|
    location[1][:players].each do |player|
      points.push(player[:points])
    end
  end
  game_hash.each do |location|
    location[1][:players].each do |player|
      if points.max == player[:points]
        return player[:player_name]
      end
    end
  end
end

def winning_team
  nets_points = 0
  hornets_points = 0
  game_hash.each do |location|
    if location[1][:team_name] == "Brooklyn Nets"
      location[1][:players].each do |player|
        nets_points += player[:points]
      end
    else
        location[1][:players].each do |player|
        hornets_points += player[:points]
      end
    end
  end
  if nets_points > hornets_points
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
end

def player_with_longest_name
  names_array = []
  game_hash.each do |location|
    location[1][:players].each do |player|
      names_array.push(player[:player_name])
    end
  end
  target_name = names_array.max_by(&:length)
  game_hash.each do |location|
    location[1][:players].each do |player|
      if player[:player_name] == target_name
        return player[:player_name]
      end
    end
  end
end

def long_name_steals_a_ton?
  result = true
  steals_array = []
  game_hash.each do |location|
    location[1][:players].each do |player|
      steals_array.push(player[:steals])
    end
  end
  most_steals = steals_array.max
  game_hash.each do |location|
    location[1][:players].each do |player|
      if player[:steals] == most_steals
         result = true
      end
    end
  end
  result
end




