# encoding = utf-8
module UsersHelper
  ROLES = [{:id => 1, :name => 'r_admin', :text => '管理员' },
           {:id => 2, :name => 'r_sale_host', :text => '销售主管' },
           {:id => 3, :name => 'r_sale', :text => '销售' },
           {:id => 4, :name => 'r_member', :text => '会员' },
           {:id => 5, :name => 'r_client', :text => '客服' }]
  def roles
    ROLES
  end
  
  def role_name name
    text = ''
    roles.each do |r|
      if name == r[:name]
        text = r[:text]
      end
    end
    text
  end
end
