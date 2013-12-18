class Order < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'mb_id'
  belongs_to :product, :foreign_key => 'pd_id'
end
