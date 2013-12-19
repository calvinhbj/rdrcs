class WelcomeController < ApplicationController
  
  #如果用户已登录  
  #判断是否会员角色  
  # 是: 判断是否有会员档案  {是:显示会员档案信息，否：进行初始化 }
  def index
    if current_user == nil then
      # do nothing
    else
      if current_user.has_role? :r_member,current_user then
        @member = Member.where(:user_id => current_user.id )
        
        if @member.length == 1 then
          @member = @member[0]
          @has_init_member_info = true
        elsif @member.length > 1
          @has_init_member_info = false
        else
          @has_init_member_info = false
        end
      elsif current_user.has_role? :r_sale_host,current_user
         @handle_list = Order.where(:fstate => 'waiting')
      end
    end
  end
  
end
