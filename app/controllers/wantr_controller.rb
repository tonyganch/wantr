class WantrController < ApplicationController
  require 'net/http'

  def index
    username = params[:user] || 'deepsweet'
    @user = JSON.parse Net::HTTP.get('api.wantr.ru', "/0.1/user/#{username}")
    @wishes = JSON.parse Net::HTTP.get('api.wantr.ru', "/0.1/wishlist/#{@user['id']}")
  end
end
