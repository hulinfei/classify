require "rails_helper"

RSpec.describe WxUser, :type => :model do
   it "新建" do
   	 site = create(:site)
     wx_user = create(:wx_user, site: site)
     expect(wx_user).to be
   end

   it "用户签到" do
   	 site = create(:site)
     wx_user = create(:wx_user, site: site)
     wx_user.sign()
     expect(wx_user.credit).to be > 0
     expect(wx_user.credit_logs.count).to be > 0
   end
end