require "rails_helper"

RSpec.describe User, :type => :model do
   it "新建用户" do
   	 site = create(:site)
     user = create(:user, site: site)
     expect(user).to be
   end

   it "用户签到" do
   	 site = create(:site)
     user = create(:user, site: site)
     user.sign()
     expect(user.credit).to be > 0
   end
end