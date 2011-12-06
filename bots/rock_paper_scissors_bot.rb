require 'image_urls'

class RockPaperScissorBot
  include ImageUrls
  
  ROCK = 'rock'
  PAPER = 'paper'
  SCISSORS = 'scissors'
  CHOICES = [ROCK, PAPER, SCISSORS]
  
  WIN = 'win'
  LOSS = 'loss'
  TIE = 'tie'
  
  def play(human_choice)
    bot_choice = choice(human_choice)
    
    result = if bot_choice === human_choice
      TIE
    else
      case bot_choice
      when ROCK then human_choice === SCISSORS ? WIN : LOSS
      when PAPER then human_choice === ROCK ? WIN : LOSS
      when SCISSORS then human_choice === PAPER ? WIN : LOSS
      else 'huh?'
      end
    end
    
    [message(result, bot_choice, human_choice, random_image_for_choice(bot_choice)), result]
  end
  
  def random_image_for_choice(choice)
    case choice
    when ROCK then ImageUrls::ROCK.choice
    when PAPER then ImageUrls::PAPER.choice
    when SCISSORS then ImageUrls::SCISSOR.choice
    else 'http://http://zurb.us/uPCBeq'
    end
  end
  
end