class ChordsController < ApplicationController
  def index
    if session[:chord_root] && session[:chord_intv]
      @chord = Chord.new(root: session[:chord_root], intv: session[:chord_intv])
    else
      @chord = Chord.new(root: "C", intv: 5)
    end
  end

  def create
    session[:chord_root] = params[:chord][:root]
    session[:chord_intv] = params[:chord][:intv].to_i

    redirect_to root_path
  end
end
