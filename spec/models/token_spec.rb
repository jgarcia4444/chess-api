
RSpec.describe Token do 
    before(:each) do
        @token = Token.create()
    end
    it "raises an error when no access token is present" do
        user = User.create(email: "test1@gmail.com", username: "testUser1", password: "Password")
        @token.update(refresh_token: "abcdefg", expires_at: DateTime.now(), user_id: user.id)
        expect(@token.valid?).to eq(false)
    end
    it "raises an error if the access token is an empty string." do
        user = User.create(email: "test2@gmail.com", username: "testUser2", password: "Password")
        @token.update(access_token: "", refresh_token: "abcdefg", expires_at: DateTime.now(), user_id: user.id)
        expect(@token.valid?).to eq(false)
    end
    it "raises an error is no refresh token is present" do 
        user = User.create(email: "test3@gmail.com", username: "testUser3", password: "Password")
        @token.update(access_token: "123456", expires_at: DateTime.now(), user_id: user.id)
        expect(@token.valid?).to eq(false)
    end
    it "raises an error if refresh token is an empty string" do
        user = User.create(email: "test4@gmail.com", username: "testUser4", password: "Password")
        @token.update(access_token: "123456", expires_at: DateTime.now(), refresh_token: "", user_id: user.id)
        expect(@token.valid?).to eq(false)
    end
    it "raises an error if expires at is not present." do
        user = User.create(email: "test5@gmail.com", username: "testUser5", password: "Password")
        @token.update(access_token: "123456", refresh_token: "abcdefg", user_id: user.id)
        expect(@token.valid?).to eq(false)
    end
    it "raises an error if expires_at is not the correct data type of datetime." do
        user = User.create(email: "test6@gmail.com", username: "testUser6", password: "Password")
        @token.update(access_token: "123456", refresh_token: "abcdefg", expires_at: "abcdef", user_id: user.id)
        expect(@token.valid?).to eq(false)
    end
    it "model is valid if it passes all validations" do
        user = User.create(email: "test7@gmail.com", username: "testUser7", password: "Password")
        @token.update(access_token: "123456", refresh_token: "abcdefg", expires_at: DateTime.now(), user_id: user.id, is_google_token: true)
        expect(@token.valid?).to eq(true)
    end
    it "raises an error if no value is given for is_google_token" do
        expect(@token.valid?).to eq(false)
    end
end