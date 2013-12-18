# encoding = utf-8
module OrdersHelper

  CODE_GROUP = {
    :order_status =>
    [{:id => 1,:text => '新建单'},
      {:id => 2,:text => '已成交'},
      {:id => 3,:text => '已退单'},
      {:id => 4,:text => '已取消'}],
      
    :pay_type =>
    [{:id => 1,:text => '现金'},
      {:id => 2,:text => '网上付款'},
      {:id => 3,:text => '货到付款'}],
      
    :pay_status =>
    [{:id => 1,:text => '已付款'},
      {:id => 0,:text => '未付款'}],
      
    :service_status =>
    [{:id => 1,:text => '未处理'},
      {:id => 2,:text => '物流处理中'},
      {:id => 3,:text => '已提供'}]
      
   }

  def type_list name
    CODE_GROUP[name]
  end

  def type_decode group,key
    group = CODE_GROUP[group]
    text = ''
    group.each do |r|
      if key == r[:id]
        text = r[:text]
      end
    end
    text
  end

end
