require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a product_name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a product_count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if customer not selected" do
    subject.customer=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the product_count is not a number" do
    subject.product_count="1A2bkj;lkj"
    expect(subject).to_not be_valid
  end

  it "is not valid if product_count is larger than 3 digits" do
    subject.product_count="5555"
    expect(subject).to_not be_valid
  end
end
