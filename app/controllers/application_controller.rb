class ApplicationController < ActionController::Base
  include Pagy::Backend

  def set_link
    @link = Link.find(params[:id])
  end
end
