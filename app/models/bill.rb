class Bill < ActiveRecord::Base
has_and_belongs_to_many :Orders
has_one :client
accepts_nested_attributes_for :client
has_and_belongs_to_many :tables

end
