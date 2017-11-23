require 'rails_helper'

RSpec.describe InfoClass, type: :model do

  let(:info_class) {
    create(:info_class)
  }
  it '新建' do
    expect(info_class).to be
  end
end
