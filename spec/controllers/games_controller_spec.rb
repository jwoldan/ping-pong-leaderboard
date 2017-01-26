require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET #new" do

    it "renders the new games page" do
      get :new
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end

  end

  describe "POST #create" do
    let(:other_user) { FactoryGirl.create(:user) }
    let(:today) { Date.today }

    context "with invalid params" do
      it "renders the new template" do
        post :create, game: {
          other_player_id: other_user.id,
          month: today.month,
          day: today.day,
          year: today.year,
        }
        expect(response).to render_template("new")
      end
    end

    context "with valid params" do
      it "redirects to the index page" do
        post :create, game: {
          other_player_id: other_user.id,
          month: today.month,
          day: today.day,
          year: today.year,
          player_score: 21,
          other_player_score: 19
        }
        expect(response).to redirect_to("/")
      end
    end
    
  end

end
