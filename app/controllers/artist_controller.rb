class ArtistController < ApplicationController

    get '/artists/:slug' do
       @artist = artist.find_by_slug(params[:slug])
        render erb :'artists/show'
       end


    get '/join' do
        if !session[:artist_id]
            erb :'artists/create_artist', locals: {message: "Please join before attempting to post your drawing"}
        else
            redirect to '/drawings'
        end
    end

    post '/join' do
        if params[:artist_name] == "" || params[:email] == "" || params[:password] == ""
            render '/join'
        else
            @artist = Artist.create(:artist_name => params[:artist_name], :email => params[:email], :password => params[:password])
            session[:artist_id] = @artist.id
            redirect to '/drawings'
        end
    end

    get '/login' do
        @error_message = params[:error]
        if !session[:artist_id]
            erb :'artists/login'
        else
            redirect '/drawings'
        end
    end

    post '/login' do
        artist = Artist.find_by(:artist_name => params[:artist_name])
        if artist && artist.authenticate(params[:password])
            session[:artist_id] = artist.id
            redirect '/drawings'
        else
            redirect to '/join'
        end
    end

    get '/logout' do
        if session[:artist_id] !=nil
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end
end
