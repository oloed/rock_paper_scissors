require 'bots/rock_paper_scissors_bot'

class TalkativeBot < RockPaperScissorBot
  
  def choice(human_choice)
    CHOICES.choice
  end
  
  def message(result, bot_choice, human_choice, image_url)
    text = case human_choice
    when ROCK
      case bot_choice
      when ROCK then ROCK_VS_ROCK.choice
      when PAPER then ROCK_VS_PAPER.choice
      when SCISSORS then ROCK_VS_SCISSORS.choice
      else
        UNKNOWN
      end
    when PAPER
      case bot_choice
      when ROCK then PAPER_VS_ROCK.choice
      when PAPER then PAPER_VS_PAPER.choice
      when SCISSORS then PAPER_VS_SCISSORS.choice
      else
        UNKNOWN
      end
    when SCISSORS
      case bot_choice
      when ROCK then SCISSORS_VS_ROCK.choice
      when PAPER then SCISSORS_VS_PAPER.choice
      when SCISSORS then SCISSORS_VS_SCISSORS.choice
      else
        UNKNOWN
      end
    else
      UNKNOWN
    end
    return "#{text} #{image_url}"
  end
  
  UNKNOWN = 'Hmm, yeah something went wrong here. Our bad.'
  
  # First is person, second is bot
  # tie
  ROCK_VS_ROCK = [
    "Looks like we're between a rock and another rock. Let's call it a tie. Again?",
    "Rock! Tie, darn it!  OK, let's go again."
  ]
  
  # we win
  ROCK_VS_PAPER = [
    "Hard hitting, but paper beats rock. We won't take cover if you try throwing another rock.",
    "We've got you covered. Literally. Paper wins. Unless you play again, we've got this wrapped up!",
    "Paper, we win. Care to wrap this up with two out of three? You're trying too hard with a rock.",
    "A well-placed rock crushes scissors. Too bad, we chose paper. We win, 2 out of 3.",
    "We got a warm blanket of paper for your rock. Play again?",
    "Didja forget how to play? We win. Let’s go for 2 out of 3.",
    "Man, you’re good. But we’re better. We win, 2 out of 3."
  ]
  
  # we lose
  ROCK_VS_SCISSORS = [
    "Try throwing another rock. We dare you. Play again.",
    "Rock crushes our scissors. This ain’t over yet. Let’s go!",
    "Rock again! You win. We gotta lot more fight left in us. Again?",
    "You’ve got some mad skills throwing that rock. Let’s go again.",
    "Maybe we outta switch to thumb war. You win.",
    "Who taught yah to play? We lose. Let’s go again.",
    "Hold fast! You may have won but we’re not finished. Let’s go again."
  ]
  
  # we lose
  PAPER_VS_ROCK = [
    "Hit us again with a rock and you’ll be sorry. Let’s go again.",
    "You’ve given us a paper cut. Let’s get a Band-Aid and play again.",
    "A’right no more Mr. Nice Guy. You win. Play again?",
    "We can’t take much more of this. Next time, we win. Let’s go!",
    "We’re just getting our second wind. Give us a chance, 2 out of 3.",
    "Maybe we’d have better luck at Candyland. You win, 2 out of 3."
  ]
  
  # tie
  PAPER_VS_PAPER = [
    "Two pieces of paper is wasteful, should have just printed double sided.",
    "Paper! Tie, darn it!  OK, let's go again."
  ]
  
  # we win
  PAPER_VS_SCISSORS = [
    "Things are looking up. Scissors cut your paper. Wanna go again?",
    "Beat yah, again! But we’re willing to give you another chance.",
    "Paper? Is that all you got? Let’s go again.",
    "You call that a strategy?  We win, 2 out of 3."
  ]
  
  # we win
  SCISSORS_VS_ROCK = [
    "Oh, we weren’t expecting that. Good thing we throw a rock. We win, 2 out of 3.",
    "Take that scissors! Rock wins. Best 2 out of 3?",
    "Scissors? What are yah some sort of cut-up? Rock wins! Play again?",
    "ZURB crush with rock. ZURB wanna play again."
  ]
  
  # we lose
  SCISSORS_VS_PAPER = [
    "That's cutting. We were expecting something a little softer. Play again?",
    "Doh! What we’re we thinking with paper? Give us another chance?",
    "Well, that didn’t work as well as we thought. Let’s go again!",
    "Snap, where’d we go wrong! Let’s play again.",
    "You’ve sunk our battleship. Oops, wrong game. You win. Again?",
    "You may have won. But we’re not going down with out a fight. Let’s go again!"
  ]
  
  # tie
  SCISSORS_VS_SCISSORS = [
    "Scissor fight! Oh, these are safety scissors. It's a tie then.  Again?",
    "Scissors! Tie, darn it!  OK, let's go again."
  ]
  
end