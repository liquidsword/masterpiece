require './config/environment'
require 'Sinatra'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "masterpiece_secret"
  end

  #https://unsplash.com/photos/Pt_YmiYm7a4


  get '/' do
    erb :index
  end

  get '/' do
    erb :create_drawing
  end

  post '/save_image' do

    @filename = params[:file][:filename]
    file = params[:file][:tempfile]

    File.open("./public/#{@filename}", 'wb') do |f|
      f.write(file.read)
    end

    erb :show_drawing
  end


  helpers do
    def redirect_if_not_logged_in
        if !logged_in?
          redirect "/login?error= Please log in to continue!"
        end
    end

    def logged_in?
      !!session[:artist_id]
    end

    def current_artist
      Artist.find(session[:artist_id])
    end
  end
end
