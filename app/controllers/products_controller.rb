class ProductsController < ApplicationController

    def index
        #Toma todos los valores en la BD
        @products = Product.all
    end    

    def show
        @product = Product.find(params[:id])
    end
end