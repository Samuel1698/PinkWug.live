require 'rails_helper'

RSpec.describe "Compression", type: :request do
  include Rack::Test::Methods

  def app
    Rails.application
  end

  it "sets Content-Encoding when browser supports compression" do
    get "/", {}, { "HTTP_ACCEPT_ENCODING" => "gzip" }
    expect(last_response.headers).to have_key "Content-Encoding"
  end

  it "does not set Content-Encoding when browser does not support compression" do
    get "/"
    expect(last_response.headers).to_not have_key "Content-Encoding"
  end
end