require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  def user
    @user ||= FactoryGirl.create(:user)
  end

  describe 'render new' do
    context 'with no sign in user' do
      it 'redirect to sign in page' do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end

    context 'with signed in user' do
      before do
        user = FactoryGirl.create(:user)
        request.session[:user_id] = user.id
        get :new
      end

      it 'render new template' do
        expect(response).to render_template(:new)
      end

      it 'assign instance variable' do
        expect(assigns(:auction)).to be_a_new Auction
      end
    end
  end

  describe 'create an auction' do
    context 'without a signed in user' do
      it 'redirect to the sign in page' do
        post :create
        expect(response).to redirect_to(new_session_path)
      end
    end  
  end

  describe 'show index' do
    it 'render index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

end
