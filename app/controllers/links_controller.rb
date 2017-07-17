class LinksController < ApplicationController
  def index
    @links = Link.where(user: current_user)
  end

  def new
    if params[:url][0..3] == "http"
      Link.create(url: params[:url], title: params[:title], user: current_user)
      head :no_content
    else
      flash[:notice] = "Please enter a Valid URL"
      head :no_content
    end
  end

  def update
    link = Link.find(params[:id])
    if params[:link]
      link.update(second_link_params)
      head :no_content
    else
      link.update(link_params)
      head :no_content
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  private
    def link_params
      params.permit(:url, :title, :read)
    end

    def second_link_params
      params.require(:link).permit(:url, :title, :read)
    end
end
