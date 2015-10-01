class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :email,:encrypted_password,:password,:password_confirmation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def make_admin
    self.admin = 1
  end
  def make_user
    self.admin = 0
  end

end
