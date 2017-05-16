class PanelController < ApplicationController
  def index
    @note = Music.new()
  end
end