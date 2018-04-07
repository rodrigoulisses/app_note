require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET#index' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user) }
    let!(:user3) { FactoryBot.create(:user) }

    it 'returns all users' do
      get :index

      expect(assigns(:users).to_a).to contain_exactly(user, user1, user2, user3)
    end
  end

  describe 'POST#create' do
    let(:params) do
      {
        user: {
          name: 'Fulano',
          email: 'fulano@email.com',
          notes_attributes: [
            {
              body: "KKKKKKK"
            },
            {
              body: "GGGG"
            }
          ]
        }
      }
    end

    it 'creates an User' do
      expect { post(:create, params: params) }.to change(User, :count).by(1)
    end

    it 'creates 2 notes' do
      expect { post(:create, params: params) }.to change(Note, :count).by(2)
    end
  end
  describe 'PATCH#update' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) do
      {
        id: user.id,
        user: {
          name: 'Fulano',
          email: 'fulano@email.com'
        }
      }
    end
    it 'changes name' do
      expect { patch(:update, params: params); user.reload }.to change(user, :name)
    end

    it 'changes email' do
      expect { patch(:update, params: params); user.reload }.to change(user, :email)
    end
  end

end
