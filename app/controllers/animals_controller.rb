class AnimalsController < ApplicationController
    def index
            animal = Animal.all 
            render json:animals
    end
    def show
        animal = Animal.find(params[:id])
        render json: animal
    end
    def create
        animal = Animal.create(animal_params)
            if animal.valid?
                render json: animal
            else 
                render json: animal.errors
            end
    end
    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
            if animal.valid?
                render json: animal
            else    
                render json: animal.errors
            end
    end
    def destroy
        animal = Animal.find(params[:id])
            if animal.destroy   
                render json:animal
            else    
                render json: animal.errors
            end
    end
end
