require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "masterpiece_secret"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:artist_id]
    end

    def current_artist
      Artist.find(session[:artist_id])
    end

  end
end