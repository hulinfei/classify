require 'rails_helper'

RSpec.describe Info, type: :model do

  let(:category) {
    create(:category)
  }
  let (:wx_user) {
    create(:wx_user)
  }

  it "新建" do
    info = Info.create(title: "xxx", price: "a", total: "1", phone: "sss",  category_id: category.id, wx_user_id: wx_user.id)
    expect(info.view_count).to eq 0

    info.inc_viewer('127.0.0.1')
    expect(info.view_count).to eq 1

    info.inc_viewer('127.0.0.1')
    expect(info.view_count).to eq 1

    info.inc_viewer('127.0.0.2')
    expect(info.view_count).to eq 2


    info.inc_viewer('127.0.0.3')
    expect(info.view_count).to eq 3


    10.times do
       info.inc_viewer('127.0.0.3')
    end
   
    expect(info.view_count).to eq 3
  end
end
