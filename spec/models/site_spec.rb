require "rails_helper"

RSpec.describe Site, :type => :model do

  let(:site) {
    create(:site)
  }
   it "新建" do
     expect(site).to be
     expect(site.logo_url).not_to eq ''
   end

   it 'delete' do
     site.destroy
     expect(Site.first).to be_nil
   end
end