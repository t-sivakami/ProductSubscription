class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy depository]
  before_action :authenticate_user!, except: %i[ index show]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = current_user.products.build
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
  @product = current_user.products.build(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def depository
    type = params[:type]
    if type =="add"
      current_user.depository_additions << @product
      redirect_to depository_index_path, notice: "#{@product.title} was added to your depository"
    elsif type == "remove"
      current_user.depository_additions.delete(@product)
      redirect_to root_path, notice: "#{@product.title} was removed from your depository"
    else
      redirect_to product_path(@product), notice: "The product has not been added. Try once again"  
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :author, :image, :user_id)
    end
end
