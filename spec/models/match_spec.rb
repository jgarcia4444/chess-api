
RSpec.describe Match do
    before(:all) do
        @winning_user = User.create(email: "test1@gmail.com", username: "testUser1", password: "Password")
        @losing_user = User.create(email: "test2@gmail.com", username: "testUser2", password: "Password")
    end
    it "raises an error if it does not have a game_duration greater than 0" do
        match = Match.create(winning_user_id: @winning_user.id, losing_user_id: @losing_user.id, game_duration: 0)
        expect(match.valid?).to eq(false)
    end
    it "raises an error if no winning user id is present" do 
        match = Match.create(losing_user_id: @losing_user.id, game_duration: 0)
        expect(match.valid?).to eq(false)
    end
    it "raises an error if a valid winning user id is not present" do
        match = Match.create(winning_user_id: 100, losing_user_id: @losing_user.id, game_duration: 0)
        expect(match.valid?).to eq(false)
    end
    it "raises an error if no losing user id is present" do 
        match = Match.create(winning_user_id: @winning_user.id, game_duration: 0)
        expect(match.valid?).to eq(false)
    end
    it "raises an error if a valid losing user id is not present" do
        match = Match.create(winning_user_id: @winning_user.id, losing_user_id: 100, game_duration: 0)
        expect(match.valid?).to eq(false)
    end
end