class ChordsController < ApplicationController
  def index
    if @chord == nil
      @chord = Chord.new(root: "C", intv: 5)
    end
  end
  
  def create
    @chord = Chord.new(root: params[:root], intv: params[:intv])
    redirect_to root_path
  end
end