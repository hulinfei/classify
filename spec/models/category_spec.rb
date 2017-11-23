require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) {
    create(:category)
  }
  it '新建' do
    expect(category).to be
  end
end
