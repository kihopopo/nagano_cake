class Customer < ApplicationRecord
   #validates checked, inclusion: [true, false]
  has_many :cart_items
  has_many :orders
  has_many :addresses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 def full_name
   self.first_name + " " + self.last_name
 end

 def full_name_kana
   self.first_name_kana + " " + self.last_name_kana
 end

 enum is_deleted: {"退会": true, "有効": false}
end
