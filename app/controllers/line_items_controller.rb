class LineItemsController < ApplicationController
  include CurrentCart
  include Counter
  before_action :set_cart, only: [:create]
  before_action :reset_counter, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    #cart's add_product method is defined in models/cart.rb

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_index_url, notice: "You have added #{product.title} to your basket!" }
        format.js   { @ganzoko = @line_item }
        #We are passing in parameters of sorts in these brackets, to help us
        #determine animation assignment, we make a @ganzoko up out of our imaginations and tell him
        #that he is @line_item. He thinks that's pretty neat, we let him loose on the wild
        #knowing that he has access to all things line_item related...at least I think so.
        #he creeps his way to the _line_item.html.erb PARTIAL where we set up an if/else statement
        #saying that if the 'line_item' about to be processed refers to him (and it can only be oneat a time)
        #he flashes yellow!
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to @line_item.cart, notice: "#{@line_item.product.title} was removed." }
      format.json { head :no_content }
      #ToDO: Remember to make sure you include the double quotes or else you cant reference scoped variables, derp;
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end

end
