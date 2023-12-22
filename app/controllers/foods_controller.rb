class FoodsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
      @foods = Food.all
    end
  
    def show
      @food = Food.find(params[:id])
    end
  
    def new
      @food = Food.new
    end
  
    def create
      @food = Food.new(food_params)
      @food.user = current_user
      
      if @food.save
        redirect_to @food, notice: 'Объект успешно создан.'
      else
        render :new, status: 422
      end
    end
  
    def edit
      @food = Food.find(params[:id])
    end
  
    def update
      @food = Food.find(params[:id])
      
      if @food.update(food_params)
        redirect_to @food, notice: 'Объект успешно загружен.'
      else
        render :edit
      end
    end
  
    def destroy
      @food = Food.find(params[:id])
      @food.destroy
      
      redirect_to foods_url, notice: 'Объект успешно удалён.'
    end
  
    private
  
    def food_params
      params.require(:food).permit(:title, :picture, :description, :price, :location)
    end
  end