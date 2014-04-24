require 'spec_helper.rb'

describe LinkedinOauthSetting, '#user' do
  it 'should return a user when a user belongs to the oauth' do
    oauth = new_oauth
    talent = Talent.create(email: "me@me.com")
    oauth.user = talent
    oauth.user.should eq(talent)
  end

  it 'should return a guest when no user belongs to the oauth' do
    oauth = new_oauth
    oauth.user.should be_a(Guest)
  end

  private

  def new_oauth
    LinkedinOauthSetting.create(
      asecret: "secret",
      atoken: "token")
  end
end
