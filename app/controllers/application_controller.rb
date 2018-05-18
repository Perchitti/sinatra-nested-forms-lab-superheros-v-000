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
    @pirate = Pirate.new(params[:pirate])
    params[:pirate][:ships].each do |item|
      Ship.new(item)
    end
    @ships = Ship.all

    erb :team

end
