class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.accessible_by(current_ability)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @member_list = User.find_by_sql(" select u.* from users_roles  ur left join roles r on ur.role_id = r.id left join users u on ur.user_id = u.id where r.name = 'r_member'")
    @product_list = Product.where(:status => 1)
  end

  # GET /orders/new
  def new
    @order = Order.new
    @member_list = User.find_by_sql(" select u.* from users_roles  ur left join roles r on ur.role_id = r.id left join users u on ur.user_id = u.id where r.name = 'r_member'")
    @product_list = Product.where(:status => 1)
  end

  # GET /orders/1/edit
  def edit
    @member_list = User.find_by_sql(" select u.* from users_roles  ur left join roles r on ur.role_id = r.id left join users u on ur.user_id = u.id where r.name = 'r_member'")
    @product_list = Product.where(:status => 1)
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
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
      params.require(:order).permit(:code, :mb_id, :pd_id, :order_status, :price, :pay_type, :pay_status, :service_status, :description)
    end
end
