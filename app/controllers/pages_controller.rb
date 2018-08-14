class PagesController < ApplicationController
  def home
  end

  def get_dataset
    render json: { lines: Line.all }
  end
end
