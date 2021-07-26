require 'rails_helper'

RSpec.describe Strip, type: :model do
  subject {
    described_class.new( title: "Relatable",
                         links: "https://twitter.com/PinkWug/status/1415352022967140358
    https://www.instagram.com/p/CRUI7fAl7j5/",
                         image: Rack::Test::UploadedFile.new("#{Rails.root}/spec/images/Relatable.jpg"))
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do 
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a title" do 
    subject.links = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an image" do 
    subject.image = nil
    expect(subject).to_not be_valid
  end
end
