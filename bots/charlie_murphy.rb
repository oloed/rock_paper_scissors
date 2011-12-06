require 'bots/rock_paper_scissors_bot'

class CharlieMurphy < RockPaperScissorBot
  
  def initialize
    @darkness = true
  end
  
  def choice(human_choice)
    CHOICES.choice
  end
  
  def message(result, bot_choice, human_choice, image_url)
    if result === WIN
      "Karate Chop, I choose #{bot_choice}! I win! #{image_url}"
    elsif result === TIE
      "#{bot_choice}! Tie. Aight. #{image_url}"
    else
      "Damn man, I choose #{bot_choice}. Look what you did to my face! I lose. #{image_url}"
    end
  end
  
end