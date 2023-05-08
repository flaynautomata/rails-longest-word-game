require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @llave = params[:letters]
    @answer = params[:answer]
    @english = english_word?(@answer)
    @include = included?(@answer, @llave)
  end

  def included?(answer, letters)
   answer.chars.all? { |e| answer.count(e) <= letters.count(e) }

  end


  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

end
