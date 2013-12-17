class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #devise :database_authenticatable, :registerable, :confirmable, :recoverable, :stretches => 20
  
  def role_names
    @names = Array.new 
    self.roles.each do |r|
      @names.push(r.name)
    end
    @names
  end
end
