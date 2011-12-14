require 'bots/rock_paper_scissors_bot'

class ZURBBot < RockPaperScissorBot
  
  def choice(human_choice)
    CHOICES.choice
  end
  
  def message(result, bot_choice, human_choice, image_url)
    if result === WIN
      "We choose #{bot_choice}! Gotcha, sucka! Best two out of three? #{image_url}"
    elsif result === TIE
      "#{bot_choice}! Tie, darn it!  OK, let's go again. #{image_url}"
    else
      "We choose #{bot_choice}!! Snap, you got me again! Best three out of four? #{image_url}"
    end
  end
  
end