require 'rails_helper'

describe MessagesController do
  # let(:user) { create(:user) }

  describe 'GET #index' do
    context 'logged in' do
      login_user
      let(:group) { create(:group, {user_ids: [subject.current_user.id]}) }

      before do
        get :index, params: { group_id: group.id }
      end

      it 'assigns @group' do
        expect(assigns(:group)).to eq group # assignsを使うのにrails-controller-testing gemが必要
      end
      it 'assigns @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end
      it 'assigns test' do
        expect(controller.instance_variable_get("@group").group_name).to include group.group_name
      end
    #   it "should have a current_user" do
    #     expect(subject.current_user).to_not eq(nil)
    #   end
      it "renders index" do
        expect(response).to render_template :index
      end
    end
    context 'not logged in' do
      before do
        user = create(:user)
        group = create(:group, {user_ids: [user.id]})
        get :index, params: { group_id: group.id }
      end
      it "redirect to new_user_session_path" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'logged in' do
      login_user
      let(:group) { create(:group, {user_ids: [subject.current_user.id]}) }

      it 'saved message' do
        expect do
          post :create, params: { group_id: group, message: attributes_for(:message) }
        end.to change{Message.count}.by(1)
      end

      it 'redirect to group_messages_path saved success' do
        post :create, params: { group_id: group, message: attributes_for(:message) }
        expect(response).to redirect_to(group_messages_path(group))
      end

      it 'not saved message' do
        expect do
          post :create, params: { group_id: group, message: attributes_for(:message, body: "", image: "") }
        end.not_to change{Message.count}
      end

      it 'redirect to group_messages_path saved unsuccess' do
        post :create, params: { group_id: group, message: attributes_for(:message, body: "", image: "") }
        expect(response).to render_template :index
      end
    end
    context 'not logged in' do
      before do
        user = create(:user)
        group = create(:group, {user_ids: [user.id]})
        post :create, params: { group_id: group, message: attributes_for(:message) }
      end
      it "redirect to new_user_session_path" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
