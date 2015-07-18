require 'rails_helper'

RSpec.describe Item, :type => :model do

  let(:item) do
    Item.create(
    id:           167,
    title:       'Baltimore Bomb',
    description: 'Delicious pie.',
    price_pie:    30.00
    )
  end

  it 'is valid' do
    expect(item).to be_valid
  end

  it 'is invalid without a title' do
    item.title = nil

    expect(item).not_to be_valid
  end

  it 'is invalid without a description' do
    item.description = nil

    expect(item).not_to be_valid
  end


  it 'is invalid without a pie price' do
    item.price_pie = nil

    expect(item).to be_valid
  end

  it 'is invalid if title is not unique' do
    2.times do
      Item.create(
      title: 'Baltimore Bomb',
      description: 'Delicious pie.',
      price_pie: 30.00
      )
    end

    result = Item.where(title: "Baltimore Bomb")
    assert_equal 1, result.count
  end

  it 'knows its categories' do
    item.categories.create(
    id: 10,
    name: "Savory"
    )
    item.categories.create(
      id: 12,
      name: "Gluten-free"
      )

    results = item.categories

    expect(results.count).to eq(2)
  end

  it 'has many orders' do
    item.orders.create(user_id: 1, order_total: 4, order_type: 'delivery', delivery_address: '1510 blanke st', order_status: 'paid')
    item.orders.create(user_id: 3, order_total: 100, order_type: 'pickup', delivery_address: '1510 blanke st', order_status: 'paid')
    result = item.orders
    expect(result.count).to eq(2)
  end

end
