class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def default_serializer_options
      {root: false}
  end

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

  def dame
    Rails.logger.debug params.inspect
    puts params.inspect
    @order = Order.create(Product_id: params[:Product_id])
    @Arreglo = params[:clientes]
    puts "asdasdsad"
    @Arreglo.each do |nombre|
      puts nombre
    end

    @producto = Product.find(params[:Product_id])
    @ISV= (@producto.Tax/100)
    @cantidadclientes = @Arreglo.size
    @subtotal= (@producto.Price)/@cantidadclientes
    @ISVneto= (@producto.Price-(@producto.Price/(1+@ISV)))/@cantidadclientes
    puts params[:bill_id]
    puts "soy un bill"

    @Arreglo.each do |nombre|
    @tamylyn = Client.find_by_sql(['SELECT * FROM clients WHERE bill_id = ? AND "Name" = ?',params[:bill_id],nombre])
      @el = @tamylyn.first
      puts "ja!"
      puts "busco"
      puts nombre
      puts "tamylyn"
      puts "primero"
      
      puts "nombre de "
  
      if (!@tamylyn.empty?)
        puts "entre"
        @temp = @tamylyn.first
        @totalprevio = @temp.Total
        @isvprevio = @temp.ISV
        puts "0"
        puts @temp[0]
        @cliente = Client.find(@temp.id)
        @cliente.Total = @totalprevio + @subtotal
        @cliente.ISV = @isvprevio + @ISVneto
        @cliente.save
      else
        puts "aqui"
        @nuevo = Client.create(Name: nombre,ISV: @ISVneto, Total: @subtotal, bill_id: params[:bill_id])
        @nuevo.save
      end 
    end
    
    @cliente =Client.where(bill_id: params[:bill_id],:Name => @Arreglo)
    puts "sigo"
    @order.Clients << @cliente
    puts "vivo"
    @actual = Bill.find(params[:bill_id])
    puts "por"
    @actual.Orders << @order
    puts "aqui"
    
    if @order.save
      render json: @order
    else
     render json:  @order.errors, status: :unprocessable_entity
     # format.html { render action: 'new' }
      #format.json { render json: @order.errors, status: :unprocessable_entity }
    end
    


  end

  def porCliente
    @bill_id = params[:bill_id]
    @client_id = params[:client_id]
    @Cliente = Client.find_by_sql(['SELECT * FROM clients WHERE bill_id = ? AND "id" = ?',@bill_id,@client_id])
    @Ordenes = Array.new
    @Cliente.Orders.each do |orden|
      @producto = Product.find(orden.Product_id)
      @temp = orden.Clients
      @Tax = (@producto.Price-(@producto.Price/(1+@producto.Tax)))/@temp.size
      @Price = @producto.Price/@temp.size
      @Ordenes << {:Nombre => producto.Name, :Precio => @Price}
    end 
    @subtotal = @Total - @Total*0.15
    @final = { :Ordenes => @Ordenes, :Subtotal => @subtotal, :Total => @Total, :ISV => @ISV  }.to_json
    render json: @final
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
