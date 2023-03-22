
RSpec.describe User do
    it "has an email present when created" do
        user = User.create(email: "test@gmail.com", username: "testUser", password: "Password")
        expect(user.email).to eq("test@gmail.com")
    end
    it "has a unique email" do
        user_1 = User.create(email: "test@gmail.com", username: "testUser", password: "Password")
        user_2 = User.create(email: "test@gmail.com", username: "testUser", password: "Password")
        expect(user_2.valid?).to eq(false)
    end
    it "has a username present" do
        user = User.create(email: "test@gmail.com", username: "testUser", password: "Password")
        expect(user.username).to eq("testUser")
    end
    it "has a unique username" do
        user_1 = User.create(email: "test@gmail.com", username: "testUser", password: "Password")
        user_2 = User.create(email: "test@gmail.com", username: "testUser", password: "Password")
        expect(user_2.valid?).to eq(false)
    end
    it "has a username of at least 5 characters" do
        user = User.create(email: "test@gmail.com", username: "testUser", password: "Password")
        expect(user.username.length).to be > 4
    end
    it "raises an error if the username is shorter than 5 characters" do
        user = User.create(email: "test@gmail.com", username: "test", password: "Password")
        expect(user.valid?).to eq(false)
    end
    it "raises an error is a password is not present" do
        user = User.create(email: "test@gmail.com", username: "testUser", password: "")
        expect(user.valid?).to eq(false)
    end
    it "raises an error if a password is less than 6 characters" do
        user = User.create(email: "test@gmail.com", username: "testUser", password: "Pass")
        expect(user.valid?).to eq(false)
    end
end