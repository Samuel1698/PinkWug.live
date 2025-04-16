require 'rails_helper'

RSpec.describe Strip, type: :model do
  subject {
    described_class.new(title: "Relatable",
                        image: Rack::Test::UploadedFile.new("#{Rails.root}/spec/images/Relatable.jpg"))
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do 
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an image" do 
    subject.image = nil
    expect(subject).to_not be_valid
  end
end
