require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations'do
  it 'should be a valid product' do
    @category = Category.create(name: "ferns")
    @product = Product.create(name: "palm tree", quantity: 15, price: 5000, category: @category)
    expect(@product).to be_valid
    end 
  it 'should have a name present' do
    @category = Category.create(name: "ferns")
    @product = Product.create(name: nil, quantity: 15, price: 5000, category: @category)
    expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end 
  it 'should have a quantity present' do
    @category = Category.create(name: "ferns")
    @product = Product.create(name: "palm tree", quantity: nil, price: 5000, category: @category)
    expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
    end 
  it 'should have a price present' do
      @category = Category.create(name: "ferns")
      @product = Product.create(name: "palm tree", quantity: 15, price: "nil", category: @category)
      @product.errors
      expect(@product.errors.full_messages).to eq ["Price is not a number"]
    end 
    it 'should have a price present' do
      @category = Category.create(name: "ferns")
      @product = Product.create(name: "palm tree", quantity: 15, price: 7000, category: nil)
      @product.errors.full_messages
      expect(@product.errors.full_messages).to eq ["Category must exist", "Category can't be blank"]
    end 
  end
end
