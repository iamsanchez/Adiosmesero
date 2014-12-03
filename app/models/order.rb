class Order < ActiveRecord::Base
  has_many :Products
  has_and_belongs_to_many :Bills
  has_and_belongs_to_many :Clients
end
