class PanelController < ApplicationController
  def index
    @note = Music.new()
    @root = "A"
  end
  
  def create
    @root = "A" #:r
    puts "HERE IT IS: #{@root}"
  end
end