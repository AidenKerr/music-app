class ChordsController < ApplicationController
  def index
    if !@chord
      @chord = Chord.new(root: "C", interval: 5)
    end
  end
  
  def create
    @chord = Chord.new(root: params[:chord][:root], interval: params[:chord][:interval].to_i, accidental: params[:chord][:accidental])
  end
end