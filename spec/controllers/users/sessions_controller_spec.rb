require 'spec_helper'

describe Users::SessionsController do

  it "should reset the session on logout" do
    controller.session[:user_id] = 'fictional'
    delete "destroy"

    controller.session[:user_id].should be_nil
    response.should redirect_to root_path
  end

  it "should redirect to CAS if user is not authenticated" do
    controller.reset_session
    get "new"

    response.should redirect_to controller.omniauth_path(:cas)
  end

  it "should redirect to requested url on callback from CAS with proper auth hash" do
    account = Dtubase::Account.new
    account.cwis = '12345'
    Dtubase::Account.should_receive(:find_by_cwis).with('98765').and_return(account)

    request.env["omniauth.auth"] = OmniAuth.mock_auth_for(:cas)
    return_url = "http://example.com/return_url"
    controller.session[:return_url] = return_url
    post "create", :provider => :cas

    controller.session[:user_id].should_not be_nil
    response.should redirect_to return_url
  end

  describe "update" do
    before do
      @user = User.new(:identifier => '4321', :provider => 'cas')
      @user.roles = [Role.find_by_code('SUP')]
      @user.save!
      session[:user_id] = @user.id
      @other_user = User.create(:username => 'test user name', :identifier => '1234', :provider => 'cas')
    end

    it "should change the user when CWIS is supplied" do
      account = Dtubase::Account.new
      account.cwis = '1234'
      Dtubase::Account.should_receive(:find_by_cwis).with('1234').and_return(account)
      put :update, user: {identifier: '1234'}
      session[:user_id].should == @other_user.id
      session[:original_user_id].should == @user.id
      response.should redirect_to root_path
    end

    it "should change the user when user name is supplied" do
      account = Dtubase::Account.new
      account.cwis = '1234'
      Dtubase::Account.should_receive(:find_by_cwis).with('test user name').and_return(nil)
      Dtubase::Account.should_receive(:find_by_username).with('test user name').and_return(account)
      put :update, user: {identifier: 'test user name'}
      session[:user_id].should == @other_user.id
      session[:original_user_id].should == @user.id
    end

    it "should block update for users without required role" do
      session[:user_id] = @other_user.id
      put :update, user: {identifier: '4321'}
      session[:user_id].should == @other_user.id
      flash[:error].should == 'Not allowed'
      response.should redirect_to root_path
    end

    it "should flash an error message when there's no match on cwis or user name" do
      account = Dtubase::Account.new
      account.cwis = '1234'
      Dtubase::Account.should_receive(:find_by_cwis).with('test user name').and_return(nil)
      Dtubase::Account.should_receive(:find_by_username).with('test user name').and_return(nil)
      put :update, user: {identifier: 'test user name'}
      flash[:error].should == 'User not found'
      response.should redirect_to switch_user_path
    end

  end

  describe "#switch" do

    before do
      @user = login
    end

    it "should deny access for a user that doesn't have \"User Support\" role" do
      get 'switch'
      response.response_code.should == 401
    end

    it "should allow access for a user that has \"User Support\" role" do
      @user.roles << Role.find_by_code('SUP') 
      get 'switch'
      response.response_code.should == 200
    end

  end

end
