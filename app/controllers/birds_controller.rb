class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # the above also is a way to just show certain info to the frontend.
    #.slice doesn't work on an array of hashes, but the above does
    #render json: @birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end


end

#could also render it in the index like:
#def index
#birds = Bird.all
#ender json: birds, except: [:created_at, :updated_at]
#end


#in show method:
#render json: {id: bird.id, name: bird.name, species: bird.species } 
#render json: bird.slice(:id, :name, :species)
#both render jsons work, just different ways to acheive the same thing