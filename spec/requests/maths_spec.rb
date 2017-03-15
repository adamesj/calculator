require 'rails_helper'

RSpec.describe "Maths", type: :request do
  describe "GET /maths" do
    it "works! (now write some real specs)" do
      get maths_index_path
      expect(response).to have_http_status(200)
    end
  end
end
