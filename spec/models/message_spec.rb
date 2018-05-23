require 'rails_helper'
describe Message do
  describe "#create" do
    context 'can save' do
      it "message only" do
        user = create(:user)
        group = create(:group, {user_ids: [user.id]})
        message = build(:message, image: "", user_id: user.id, group_id: group.id)
        expect(message).to be_valid
      end

      it "image only" do
        user = create(:user)
        group = create(:group, {user_ids: [user.id]})
        message = build(:message, body: "", user_id: user.id, group_id: group.id)
        expect(message).to be_valid
      end

      it "message and image" do
        user = create(:user)
        group = create(:group, {user_ids: [user.id]})
        message = build(:message, user_id: user.id, group_id: group.id)
        expect(message).to be_valid
      end
    end

    context "can not save" do
      it "message and image nothing" do
        user = create(:user)
        group = create(:group, {user_ids: [user.id]})
        message = build(:message, body: "", image: "", user_id: user.id, group_id: group.id)
        message.valid?
        expect(message.errors[:body]).to include('を入力してください')
      end

      it "group_id nothing" do
        user = create(:user)
        group = create(:group, {user_ids: [user.id]})
        message = build(:message, body: "", image: "", user_id: user.id, group_id: "")
        message.valid?
        expect(message.errors[:group]).to include('を入力してください')
      end

      it "user_id nothing" do
        user = create(:user)
        group = create(:group, {user_ids: [user.id]})
        message = build(:message, body: "", image: "", user_id: "", group_id: group.id)
        message.valid?
        expect(message.errors[:user]).to include('を入力してください')
      end
    end
  end
end