class StaticPagesController < ApplicationController
    require 'flickr'
 
  def index
    flickr = Flickr.new ENV['key'], ENV['secret']
    if params[:user] != nil && params[:user] != ''
      
      begin 
        @images = flickr.people.getPhotos(user_id: params[:user])
      rescue Flickr::FailedResponse
        flash.now[:alert] = 'User not found or the user has no photos.'

      end
    else
      render :index
    end
  end
end