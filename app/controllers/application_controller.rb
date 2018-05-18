require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :new
    end

    get '/new' do
      erb :new
    end

    post "/team" do
    @team = Team.new(params[:team])
    params[:team][:superheros].each do |item|
      SuperHero.new(item)
    end
    @superhero = SuperHero.all

    erb :team

end
