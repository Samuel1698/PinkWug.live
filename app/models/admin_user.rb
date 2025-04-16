class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
        :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at remember_created_at reset_password_sent_at]
  end
end