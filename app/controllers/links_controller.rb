class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  def index
    @links = Link.recent_first
    @link ||= Link.new
  end

  def show
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      respond_to do |format|
        format.turbo_stream
        format.html
        format.js
        format.json
        format.xml
        format.any { head :no_content }
        MetadataJob.perform_later(@link.id)
        ViewsJob.perform_later(@link.id)
       redirect_to root_path, notice: 'Link was successfully created.'
      end
    else
      index
      render :index, status: :unprocessable_entity
    end
  end

  def edit

  end


  def update
    if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path, notice: 'Link was successfully destroyed.'
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
