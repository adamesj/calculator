require 'rails_helper'

RSpec.describe MathsController, type: :controller do

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #calculate' do
    it "assigns a new MathEngine to engine" do
    end
  end

  describe 'GET #calculate_poorly' do
    it "renders the :calculate_poorly template" do
    end
  end

end
