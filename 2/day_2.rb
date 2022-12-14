#!/usr/bin/env ruby

class Day2
  A = "A".ord.freeze
  X = "X".ord.freeze
  ROCK = 1.freeze
  PAPER = 2.freeze
  SCISSORS = 3.freeze
  # Strategies
  FOLLOW = 1.freeze
  REACT = 2.freeze
  # REACT strategy choices
  LOSE = 1.freeze
  DRAW = 2.freeze
  WIN = 3.freeze

  def self.run
    decoded_lines = convert(File.readlines("2/input"))
    actual_games =
      decoded_lines.map do |line|
        apply_strategy(line, REACT) # or FOLLOW
      end
    total(actual_games)
  end

  def self.convert(lines)
    lines.map do |line|
      vals = line.split(" ")
      [vals[0].ord - A + 1, vals[1].ord - X + 1]
    end
  end

  def self.total(games)
    games.inject(0) { |total, game| total + score(game) }
  end

  def self.score(game)
    game[1] + result(game)[1]
  end

  def self.apply_strategy(plays, strategy = FOLLOW)
    if strategy == FOLLOW
      plays
    else
      response =
        case plays[1]
        when Day2::LOSE
          ([ROCK, PAPER, SCISSORS] - [plays[0], nemesis(plays[0])])[0]
        when Day2::DRAW
          plays[0]
        when Day2::WIN
          nemesis(plays[0])
        end
      [plays[0], response]
    end
  end

  def self.result(plays)
    if plays[0] == plays[1]
      [3, 3]
    elsif nemesis(plays[0]) == plays[1]
      [0, 6]
    else
      [6, 0]
    end
  end

  def self.nemesis(play)
    case play
    when ROCK
      PAPER
    when PAPER
      SCISSORS
    else
      ROCK
    end
  end
end

puts Day2.run
