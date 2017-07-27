class LinksController < ApplicationController
  def index
    redirect_to login_path unless current_user
    @links = Link.where(user: current_user)
  end

  def new
    if params[:url][0..3] == "http"
      Link.create(url: params[:url], title: params[:title], user_id: current_user.id)
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
      redirect_to root_path
    else
      link.update(link_params)
      redirect_to root_path
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
