class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :icon, type: String
  has_many :articles
end
