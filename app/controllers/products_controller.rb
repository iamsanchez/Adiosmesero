class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def default_serializer_options
      {root: false}
    end
  # GET /products
  # GET /products.json
  def index
    # @products = Product.order("Category_id ASC")
  
  # @ja = Product.find_by_sql('SELECT * FROM products 
  #INNER JOIN categories ON products."Category_id" = categories.id
  #ORDER BY products."Category_id", products."Price"')




    #@categories = Category.all
    #@bill = Bill.find(session[:bill_id])
    #@order = Order.new
    #@clientes = Client.where("bill_id = ?",session[:bill_id])

    render json: Product.all
  end

  def as_json(options={})
    super(:only => [:Name, :Description, :Price])
  end

  # GET /products/1
  # GET /products/1.json
  def show
        #@categories = Category.all;
    @product = Product.find(params[:id])
    render json: @product
    #respond_to do |format|
    #format.json { render json: @product }
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all
  end


  def binding
      redirect_to products_url
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all
  end

  # POST /products
  # POST /products.json
  def create
    @categories = Category.all;
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def entrada 
  # 5 entrada, 6 Plato, 7 Postre
  render json: Product.where(Category_id: 1)
  end

  def plato 
  render json: Product.where(Category_id: 2)
  end

  def postre 
  render json: Product.where(Category_id: 4)
  end

  def bebida
  render json: Product.where(Category_id: 3)
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @categories = Category.all;
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:Name, :Description, :Image, :Tax, :Price, :Category_id,)
    end
end
