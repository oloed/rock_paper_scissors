require 'bots/rock_paper_scissors_bot'

class ZURBBot < RockPaperScissorBot
  
  def choice(human_choice)
    CHOICES.choice
  end
  
  def message(result, bot_choice, human_choice, image_url)
    if result === WIN
      "I choose #{bot_choice}! I win! Wanna go again? #{image_url}"
    elsif result === TIE
      "#{bot_choice}! Tie. Alright, let's give it another shot. #{image_url}"
    else
      "I choose #{bot_choice}. Yikes, you got me. Again? #{image_url}"
    end
  end
  
end