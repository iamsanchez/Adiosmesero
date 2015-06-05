class ProductSerializer < ActiveModel::Serializer
  attributes :id, :Name, :Description, :Image, :Tax, :Price
end


