class ProductsController < ApplicationController
  
  # GET /products
  # GET /products.json
  def index
  	@products = Product.all

  	respond_to do |format| 
  		format.html #index.html.erb
  		format.json { render json: @products } 
  	end

  end

  # GET /products/1
  # GET /products/1.json
  def show
  	@product = Product.find(params[:id])

  	respond_to do |format| 
  		format.html #show.html.erb
  		format.json { render json: @product }
  	end
  end

  # GET /products/new
  # GET /products/new.json
  def new
  	@product = Product.new

  	respond_to do |format| 
  	format.html #new.html.erb
  	format.json { render json: @product }
  	end

  end

  # GET /products/edit/1
  # GET /products/edit/1.json
  def edit
  	@product = Product.find(params[:id])

  	respond_to do |format|
  		format.html #edit.html.erb
  		format.json { render json: @product }
  	end

  end

  def create
  	@product = Product.new(product_params)

  	respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
     end
  end

  def update
  	@product = Product.find(params[:id])
  	
	respond_to do |format|
	      if @product.update_attributes(product_params)
	        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	end

  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy

  	respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end

private

	def product_params
		params.require(:product).permit(:name, :description, :price_in_cents)
	end
