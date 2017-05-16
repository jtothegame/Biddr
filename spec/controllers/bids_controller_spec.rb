require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  def user
    @user ||= FactoryGirl.create(:user)
  end

  describe 'create a post' do
    context 'without a signed in user' do
      it 'redirect to the sign in page' do
        post :create, auction_id: 1
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
