require 'rubygems'
require 'tweetstream'
require 'twitter'
require 'pp'
require 'logger'
require 'bots/charlie_murphy'

CONFIG = YAML.load_file("config.yml")
opponents = [CharlieMurphy.new]

search_phrase = 'rock_paper_scissors'
bot_screen_name = "@#{CONFIG['bot_screen_name']}"

def log(message)
  puts message
end

TweetStream.configure do |config|
  config.consumer_key = CONFIG['consumer_key']
  config.consumer_secret = CONFIG['consumer_secret']
  config.oauth_token = CONFIG['oauth_token']
  config.oauth_token_secret = CONFIG['oauth_token_secret']
end

Twitter.configure do |config|
  config.consumer_key = CONFIG['consumer_key']
  config.consumer_secret = CONFIG['consumer_secret']
  config.oauth_token = CONFIG['oauth_token']
  config.oauth_token_secret = CONFIG['oauth_token_secret']
end

client = TweetStream::Daemon.new

client.on_limit do |skip_count|
  log "We've been limited #{skip_count} times"
end

client.on_error do |message|
  log message
end

client.on_reconnect do |timeout, retries|
  log "Reconnect timeout: #{timeout} retries: #{retries}"
end

client.track(bot_screen_name) do |status|
  log status.text

  choice = %w{rock paper scissors}.detect do |choice|
    status.text.downcase.include?(choice)
  end
  
  opponent = opponents.choice
  
  opponent_response, result = opponent.play(choice)
  
  if choice
    message = "@#{status.user.screen_name} #{opponent_response}"
    Twitter.update(message)
  end

end