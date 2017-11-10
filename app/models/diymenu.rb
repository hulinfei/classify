class Diymenu
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Tree

  paginates_per 5

  CLICK_TYPE = 'click' # key
  VIEW_TYPE  = 'view'  # url

  field :name, type: String
  field :key, type: String
  field :url, type: String
  field :is_show, type: Mongoid::Boolean, default: true

  belongs_to :site

 # 优先为 click 类型
  def type
    key.present? ? CLICK_TYPE : VIEW_TYPE
  end

  def button_type(jbuilder)
    view_type? ? (jbuilder.url url) : (jbuilder.key key)
  end

  def view_type?
    type == VIEW_TYPE
  end


  def self.build_menu(site)
    parent_menus = Diymenu.roots
    menu = Jbuilder.encode do |json|
      json.button(parent_menus) do |menu|
        json.name menu.name
        if menu.children.any?
          json.sub_button(menu.children) do |sub_menu|
            json.type sub_menu.type
            json.name sub_menu.name
            sub_menu.button_type(json)
          end
        else
          json.type menu.type
          menu.button_type(json)
        end
      end
    end
    site.client.create_menu(menu)
  end
end

  