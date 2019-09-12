class Api::ProductsController < ApplicationController
    def index
        @products = Product.all
        render 'api/products/index'
    end

    def show
        @product = Product.find(params[:id])
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            render 'api/products/show'
        else
            render json: ["Cannot create new product listing"], status: 401
        end
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            render 'api/products/show'
        else
            render json: ["Cannot update product"], status: 401
        end
    end

    def destroy
        @product = Product.find(params[:id])
        if @product.destroy
            render 'api/products/show'
        else
            render json: @product.errors.full_messages, status: 422
        end
    end

    def product_params 
        params.require(:product).permit(:title, :description, :brand, :release_date, :retail_price)
    end
end