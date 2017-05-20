class ChordsController < ApplicationController
  def index
    if @chord == nil
      @chord = Chord.new(root: "C", intv: 5)
    end
  end

  def create
    @chord = Chord.new(root: params[:chord][:root], intv: params[:chord][:intv].to_i)
  end
end
