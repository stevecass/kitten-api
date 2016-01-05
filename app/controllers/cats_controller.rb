class CatsController < ApplicationController
  def index
    cats = Cat.all
    render json: cats, methods: [:breed_name]
  end

  def show
    cat = Cat.find(params[:id])
    render json: cat, methods: [:breed_name]
  end

  def update
    cat = Cat.find(params[:id])
    update_and_show_cat cat
  end

  def create
    cat = Cat.new
    update_and_show_cat cat, 201
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy
    render json: cat, methods: [:breed_name]
  end

  private

  def update_and_show_cat(cat, status=200)
    cat.assign_attributes(cat_params)
    if cat.save
      render json: cat, methods: [:breed_name], status: status
    else
      render json: {errors: cat.errors.full_messages.join(' ')}, status: 422
    end
  end

  def cat_params
    params.permit(:name, :breed_id, :born_on, :image_url)
  end

end
