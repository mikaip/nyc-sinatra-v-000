require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    # @landmarks = Landmark.all
    # @titles = Title.all
    erb :'figures/new'
    # binding.pry
  end

  post '/figures' do
    # raise params.inspect
    # binding.pry
     @figure = Figure.create(params["figure"])



    if !params[:landmark][:name].empty?
       @figure.landmarks << Landmark.create(params[:landmark])
     end


    if !params[:title][:name].empty?
       @figure.titles << Title.create(params[:title])
     end

     @figure.save
    #  erb :"/figures/show"
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end



  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    #  binding.pry


    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    # binding.pry

      #  @figure.update(params[:figure])

    @figure.save
    redirect "/figures/#{@figure.id}"


  end



end
