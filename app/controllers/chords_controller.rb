class ChordsController < ApplicationController
  def index
    @chord = Chord.new(rootBase: "C", intervals: "0 4 7")
  end
  
  def create
    @chord = Chord.new(rootBase: params[:chord][:rootBase], intervals: params[:chord][:intervals], accidental: params[:chord][:accidental])
  end
end