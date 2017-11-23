require 'rails_helper'

RSpec.describe InfoType, type: :model do

  let(:info_type) {
    create(:info_type1)
  }

  it '新建' do
    expect(info_type).to be
  end
end
