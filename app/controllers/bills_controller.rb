class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
   
  respond_to :json

  def default_serializer_options
      {root: false}
  end

  def maybelline
    @tables = Table.order(id: :asc)
    render json: @tables
  end

  def creation #Ocupo mesa_id
    @mesa = Table.find(params[:table_id])
    @mesa.used = true
    @bill = Bill.new(paid: false)
    @bill.save
    @mesa.save
    @bill.tables << @mesa
    @mesa.Bills << @bill
      render json: @bill
    
  end

  def pay
    @bill=Bill.find(params[:bill_id])
    @mesa=Table.find(params[:table_id])
    @bill.paid = true
    @mesa.used = false  
    @bill.save
    @mesa.save
    render json: @bill
  end

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
    @categories = Category.all
  end

  # GET /bills/1
  # GET /bills/1.json
  def show

    @Cliente = Client.where(bill_id: params[:id])
    @Cliente.each do |mitad|
      mitad.ISV = mitad.ISV.round(2)
      mitad.Total = mitad.Total.round(2)
    end
#    @Cliente = Client.find_by_sql(['SELECT * FROM clients WHERE bill_id = ?',:id])
    render json: @Cliente
  end

  # GET /bills/new
  def new
    @bill = Bill.new
    @client = Client.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)
    @client = Client.new(params[:Client])
    @bill.client_id = @client.id
    @client.save

    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bill }
      else
        format.html { render action: 'new' }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params[:bill].permit(:Client)
    end
end
