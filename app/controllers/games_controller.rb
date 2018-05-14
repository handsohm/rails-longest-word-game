require 'open-uri'

class GamesController < ApplicationController

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }.join(" ")
  end

  def score
    @letter = params[:word]

    @letter.chars.each do |l|
      if @letter.include?(l)
        @answer = "#{@letter} can be built out of #{params[:letters]}..."
      else
        @answer = "Sorry but #{@letter} can't be built out of #{params[:letters]}..."
      end
    end
    if english_word?(@letter)
      @answer = "Congratulations! #{@letter} is a valid English word!"
    else
      @answer = "Sorry but #{@letter} does not seem to be a valid English word"
    end

  end
end



