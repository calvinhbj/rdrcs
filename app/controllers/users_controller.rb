class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index 
    @users = User.all
  end
  
  def show
    @roles = Role.all
  end
  
  def new
    @user = User.new
    @roles = Role.all
  end
  
  def edit
    @roles = Role.all
  end
  
  def update
    #删除所有关联角色
    all_roles = Role.all
    all_roles.each{ |r|
      @user.remove_role r.name.to_sym , @user
    }
    
    #关联角色
    roles = params.require(:roles)
    roles.each{|rolename| 
          @user.add_role rolename , @user
    }
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destory
    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :roles )
    end
end
