class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :phone, type: String
  field :view, type: Integer
  field :details, type: String
  belongs_to :category
end
