require_relative '../invite_customer.rb'

describe InviteCustomer do     
	before (:each) do
		@invite_customer = InviteCustomer.new('customer.json')
		@send_invitation = @invite_customer.invite
	end

	it "checks the user id and name  is returned who lives under 100 km" do
		expect(@send_invitation.any? {|hash| hash['id'] == 1 && hash['name'] == 'User1'}).to be true
		expect(@send_invitation.any? {|hash| hash['id'] == 2 && hash['name'] == 'User2'}).to be true
		expect(@send_invitation.any? {|hash| hash['id'] == 3 && hash['name'] == 'User3'}).to be true
	end
	
	it "checks the user who lives more than 100 km is not returned" do
		expect(@send_invitation.any? {|hash| hash['id'] != 4 && hash['name'] != 'User4'}).to be true
		expect(@send_invitation.any? {|hash| hash['id'] != 5 && hash['name'] != 'User5'}).to be true
		expect(@send_invitation.any? {|hash| hash['id'] != 6 && hash['name'] != 'User6'}).to be true
	end

	it  "checks the customers are in sorted order of id" do
		for i in 0..(@send_invitation.length - 2)
	      expect(@send_invitation[i]['id']).to be < @send_invitation[i+1]['id']
	    end
	end
end