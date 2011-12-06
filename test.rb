# require 'bots/rock_paper_scissors_bot'

class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

def run_test
  require "bots/#{ARGV[0].underscore}"
  opponent = eval "#{ARGV[0]}.new"
  
  choices = %w{rock paper scissors}
  n = 100
  wins = 0
  losses = 0
  ties = 0
  
  n.times do
    choice = choices.choice
    opponent_message, result = opponent.play(choice)
    
    case result
    when RockPaperScissorBot::WIN then wins += 1
    when RockPaperScissorBot::LOSS then losses += 1
    when RockPaperScissorBot::TIE then ties += 1
    else
    end

    puts "#{choice.upcase}: #{opponent_message}"
  end
  
  puts ''
  puts "#{wins} wins, #{losses} losses, #{ties} ties, #{wins.to_f / (wins + losses)} win percentage"
end

if ARGV[0]
  run_test
else
  puts "You need to specify a bot class, something like:"
  puts "ruby test.rb CharlieMurphy"
end