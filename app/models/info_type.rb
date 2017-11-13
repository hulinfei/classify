class InfoType
  include Mongoid::Document
  field :fieldname, type: String
  field :fieldtype, type: String
  field :optype, type: String
  field :validation_rule, type: String
end
