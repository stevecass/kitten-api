class BreedsController < ApplicationController
  def index
    breeds = Breed.all
    render json: breeds
  end

  def show
    breed = Breed.find(params[:id])
    render json: breed
  end

  def update
    breed = Breed.find(params[:id])
    update_and_show_breed breed
  end

  def create
    breed = Breed.new
    update_and_show_breed breed, 201
  end

  def destroy
    breed = Breed.find(params[:id])
    breed.destroy
    render json: breed
  end

  private

  def update_and_show_breed(breed, status=200)
    breed.assign_attributes(breed_params)
    if breed.save
      render json: breed, status: status
    else
      render json: {errors: breed.errors.full_messages.join(' ')}, status: 422
    end
  end

  def breed_params
    params.permit(:name, :description)
  end

end
