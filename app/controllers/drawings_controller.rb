class DrawingsController < ApplicationController

    get '/drawings' do
        if session[:artist_id]
            @drawings = Drawing.all
            erb :'drawings/drawings'
        else
            redirect to '/login'
    end

    get '/drawing/new' do
        redirect_if_not_logged_in
        @error_message = params[:error]
        erb :'drawing/new'
    end

    post '/drawing' do
        redirect_if_not_logged_in
        if params[:art]== ""
            redirect to '/drawing/new'
        else
            artist = Artist.find(session[:artist_id])
            @drawing = drawing.create(:art => params[:art], :artist_id => artist.id)
            redirect to "/drawing/#{@drawing.id}"
        end
    end

    get '/drawing/:id' do
        redirect_if_not_logged_in       
        @drawing = drawing.find(params[:id])
        erb :'/drawing/show_drawing'
    end

    get '/drawing/:id/edit' do
        redirect_if_not_logged_in
        @error_message = params[:error]
        if session[:artist_id]
            @drawing = drawing.find(params[:id])
            if @drawing.artist_id == session[:artist_id]
                erb :'drawing/edit_drawing'
            else
                redirect to '/drawing'
            end
        else
            redirect to '/login'
        end
    end
        
    patch '/drawing/:id' do
        if params[:art] == ""
            redirect to "/drawing/#{params[:id]}/edit"
        else
            @drawing = drawing.find(params[:id])
            @drawing.art = params[:art]
            @drawing.save
            redirect to "/drawing/#{@drawing.id}"
        end
    end
    
    delete '/drawing/:id/delete' do
        @drawing = drawing.find(params[:id])
        if session[:artist_id]
            @drawing = drawing.find(params[:id])
            if @drawing.artist_id == session[:artist_id]
                @drawing.delete
                redirect to '/drawing'
            else
                redirect to '/drawing'
            end
        else
            redirect to '/login'
        end
    end
end
end
