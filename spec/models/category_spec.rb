require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) do
  	Category.create(id: 1 ,name: "Savory")
  end

  it 'is valid' do
  	expect(category).to be_valid
  end

  it 'is invalid without a name' do
  	category.name = nil

  	expect(category).not_to be_valid
  end

  it 'knows its items' do
    category.items.create(
    	id: 140,
    	title: 'Key Lime',
    	description: 'Yum',
    	price_pie: 28.00
    	)
    category.items.create(
    	id: 125,
    	title: 'Apple',
    	description: 'Yum',
    	price_pie: 28.00
    	)

    results = category.items

    expect(results.count).to eq(2)
  end

  it 'joins item titles' do
    category.items.create(
    	id: 140,
    	title: 'Key Lime',
    	description: 'Yum',
    	price_pie: 28.00
    	)
    category.items.create(
    	id: 125,
    	title: 'Apple',
    	description: 'Yum',
    	price_pie: 28.00
    	)

    expect(category.item_titles).to eq('Key Lime, Apple')
  end
end
