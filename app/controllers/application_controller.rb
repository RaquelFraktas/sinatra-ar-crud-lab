
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end



  get '/articles/new' do

    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect to '/articles/#{@article.id}'
  end


  get '/articles/:id' do

    @article = Article.find(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do

    erb :edit
  end

  delete '/articles/:id' do
    redirect to '/articles'
  end


end
