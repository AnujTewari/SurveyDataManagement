require 'rails_helper'
describe User do
  fixtures :users
  describe 'user model methods' do
    it 'should be user by default' do
      users(:user1).admin.should == 0
      users(:user2).admin.should == 0
    end
    it 'should make it admin' do
      users(:user1).make_admin
      users(:user1).admin.should == 1
      users(:user2).make_admin
      users(:user2).admin.should == 1
    end
    it 'should make it user' do
      users(:user1).make_user
      users(:user1).admin.should == 0
      users(:user2).make_user
      users(:user2).admin.should == 0 
    end
  end
end


