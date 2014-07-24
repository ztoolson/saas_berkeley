class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    p1 = player1[1].upcase
    p2 = player2[1].upcase

    unless ['P', 'R', 'S'].include? p1 and ['P', 'R', 'S'].include? p2
      raise NoSuchStrategyError, 'Strategy must be one of R,P,S'
    end

    # Player 1 wins under these conditions:
    if (p1 == 'S' && p2 == 'P') || # Scissors > Paper
       (p1 == 'P' && p2 == 'R') || # Paper > Rock
       (p1 == 'R' && p2 == 'S') || # Rock > Scissors
        p1 == p2
      return player1
    else
      return player2
    end

  end

  def self.tournament_winner(tournament)
    if tournament[0][0].is_a? String
      return self.winner(tournament[0], tournament[1])
    end

    self.winner(self.tournament_winner(tournament[0]), self.tournament_winner(tournament[1]))
  end

end


@rock = ['Armando','R'] ; @paper = ['Dave','P'] ; @scissors = ['Sam','S']
RockPaperScissors.winner(@rock, @scissors)
RockPaperScissors.winner(@rock, @paper)
