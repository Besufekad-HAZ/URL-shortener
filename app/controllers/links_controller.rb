class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :check_if_editable, only: [:edit, :update, :destroy]
  def index
    @links = Link.recent_first
    @link ||= Link.new
  end

  def show
  end

  def create
  @link = Link.new(link_params.with_defaults(user: current_user))
  @link.user = current_user
  if @link.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream {
        render turbo_stream: [
          turbo_stream.prepend("links", partial: "links/link", locals: { link: @link }),
          turbo_stream.replace("new_link", partial: "links/form", locals: { link: Link.new })
        ]
      }
    end
  else
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

  def check_if_editable
    unless @link.editable_by?(current_user)
      redirect_to root_path, alert: "You can't edit this link"
    end
  end
end
