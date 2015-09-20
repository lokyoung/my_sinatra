require 'sinatra'

before do
  content_type :txt
  @defeat = { rock: :scissors, paper: :rock, scissors: :paper }
  @throws = @defeat.keys
end

get '/throw/:type' do
  player_action = params[:type].to_sym

  unless @throws.include?(player_action)
    halt 403, "You must input one of the following: #{@throws}"
  end

  computer_action = @throws.sample

  if player_action == computer_action
    'Tie!'
  elsif computer_action == @defeat[player_action]
    'You win!'
  else
    'You lose!'
  end
end
