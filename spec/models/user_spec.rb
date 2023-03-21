
RSpec.describe User do
    it "has an email present when created" do
        user = User.create(email: "test@gmail.com", username: "testUser", password: "Password")
        expect(user.email).to eq("test@gmail.com")
    end
    it "has a unique email" do
    end
    it "has a username present" do
    end
    it "has a unique username" do
    end
    it "has a username of at least 5 characters" do
    end
end