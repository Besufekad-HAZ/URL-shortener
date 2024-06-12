class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
end
