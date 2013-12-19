require "state_machine"  
class Order < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'mb_id'
  belongs_to :product, :foreign_key => 'pd_id'
  
  # 状态标志 --> :fstate
  # 状态 -->  draft 草稿 waiting : 等待处理  validate：审核通过  return:退回
  # 动作 -->  agree:同意 disagree: 不同意  submit:提交审核
  state_machine :fstate, :initial => :draft do
    event :agree do
      transition :waiting => :validate
    end
    
    event :disagree do
      transition :waiting => :return
    end
    
    event :submit do
      transition :draft => :waiting
      transition :return => :waiting
    end
  end
  
  def showImg  
                options={}  
                options[:format]='jpg'  
                StateMachine::Machine.draw(Order.to_s, options)  
  end
end
