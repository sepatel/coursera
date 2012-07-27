class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each {|player|
    # TODO Instructions do not say to check for strategy being a valid array structure. Not checking intentionally.
    raise NoSuchStrategyError unless ['R', 'P', 'S'].include? player[1]
  }
  if game[0][1] == game[1][1]
    return game[0]
  elsif "R" == game[0][1]
    return "P" == game[1][1] ? game[1] : game[0]
  elsif "P" == game[0][1]
    return "S" == game[1][1] ? game[1] : game[0]
  elsif "S" == game[0][1]
    return "R" == game[1][1] ? game[1] : game[0]
  end
end

def rps_tournament_winner(tournament)
  raise StandardError unless tournament.is_a? Array
  return tournament unless tournament[0].is_a? Array
  left = rps_tournament_winner(tournament[0])
  right = rps_tournament_winner(tournament[1])
  rps_game_winner([left, right])
end

