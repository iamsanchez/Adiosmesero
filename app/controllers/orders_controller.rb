class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @products = Product.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @products = Product.all
  end

  # GET /orders/new
  def new
    @order = Order.new
    @products = Product.all
    
  end

  # GET /orders/1/edit
  def edit
    @products = Product.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order= Order.new(order_params)
    @Nombres = params[:Intentemos]
    @Arreglo = @Nombres.split(",")
    @producto = Product.find(@order.Product_id)
    @ISV= (@producto.Tax/100)
    @cantidadclientes = @Arreglo.size
    @subtotal= (@producto.Price)/@cantidadclientes
    @ISVneto= (@producto.Price-(@producto.Price/(1+@ISV)))/@cantidadclientes
    @Arreglo.each do |nombre|
      if (Client.where("Name = ? AND bill_id = ? ",nombre,session[:bill_id]).exists?)
        @temp = Client.where("Name = ? AND bill_id = ? ",nombre,session[:bill_id]).first
        @totalprevio = @temp.Total
        @isvprevio = @temp.ISV
        @temp.Total= @totalprevio + @subtotal
        @temp.ISV= @isvprevio + @ISVneto
        @temp.save
      else
        @nuevo = Client.new(Name: nombre,ISV: @ISVneto, Total: @subtotal, bill_id: session[:bill_id])
        @nuevo.save
      end 
    end
    
    @cliente =Client.where(bill_id: session[:bill_id],:Name => @Arreglo)
    @order.Clients << @cliente
    @actual = Bill.find(session[:bill_id])
    @actual.Orders << @order
    respond_to do |format|
      if @order.save
        format.html { redirect_to products_url, notice: 'Ok'  }
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:Product_id, :Orden)
    end
end
