class UrlsController < ApplicationController

  def index
    @urls = Url.all.reverse
    @url = Url.new
  end

  def create
    if current_user
      user = User.find(session[:user_id])
      @url = Url.new(params[:url])
      if @url.save
        user.urls << @url
        redirect_to url_path(@url.id)
      else
        flash.now[:errors] = @url.errors.full_messages
        @urls = Url.all.reverse
        render :index
      end
    else
      flash.now[:errors] = ['Must be signed in to longen URLs']
      @user = User.new
      render 'users/new'
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  # def long
  #   url = Url.find(params[:id])
  #   url.click_count += 1
  #   url.save
  #   redirect_to "#{url.original_url}"
  # end
end
