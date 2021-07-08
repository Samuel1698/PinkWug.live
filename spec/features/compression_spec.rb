require 'rails_helper'

RSpec.feature "compression: ", type: :feature do
  scenario "a visitor has a browser that supports compression" do
    get root_path, headers: { HTTP_ACCEPT_ENCODING: "gzip" }
    expect(response.headers).to have_key "Content-Encoding"
  end

  scenario "a visitor's browser does not support compression" do
    get root_path
    expect(response.headers).to_not have_key "Content-Encoding"
  end
end
