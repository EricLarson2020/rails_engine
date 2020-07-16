require "rails_helper"
describe 'Business API Endpoints' do
  before(:each) do
    FactoryBot.reload
  customer = create(:customer)
  @merchant1 = create(:merchant)
  @merchant2 = create(:merchant)
  @merchant3 = create(:merchant)


  item1 = create(:item, merchant: @merchant1)
  item2 = create(:item, merchant: @merchant2)
  item3 = create(:item, merchant: @merchant3)


  invoice1 = create(:invoice, merchant: @merchant1, customer: customer, created_at: '2012-03-20 14:54:09 UTC')
  invoice2 = create(:invoice, merchant: @merchant1, customer: customer, created_at: '2012-03-20 14:54:09 UTC')
  invoice3 = create(:invoice, merchant: @merchant1, customer: customer, created_at: '2012-03-20 14:54:09 UTC')
  invoice4 = create(:invoice, merchant: @merchant2, customer: customer, created_at: '2012-03-20 14:54:09 UTC')
  invoice5 = create(:invoice, merchant: @merchant2, customer: customer, created_at: '2012-03-20 14:54:09 UTC')
  invoice6 = create(:invoice, merchant: @merchant2, customer: customer)
  invoice7 = create(:invoice, merchant: @merchant3, customer: customer)
  invoice8 = create(:invoice, merchant: @merchant3, customer: customer)
  invoice9 = create(:invoice, merchant: @merchant3, customer: customer)


  invoice_item = create(:invoice_item, item: item1, invoice: invoice1, quantity: 22, unit_price: 0.01)
  invoice_item = create(:invoice_item, item: item1, invoice: invoice2, quantity: 1, unit_price: 0.05)
  invoice_item = create(:invoice_item, item: item1, invoice: invoice3, quantity: 72, unit_price: 8)
  invoice_item = create(:invoice_item, item: item2, invoice: invoice4, quantity: 60, unit_price: 10)
  invoice_item = create(:invoice_item, item: item2, invoice: invoice5, quantity: 4, unit_price: 5)
  invoice_item = create(:invoice_item, item: item2, invoice: invoice6, quantity: 5, unit_price: 1)
  invoice_item = create(:invoice_item, item: item3, invoice: invoice7, quantity: 81, unit_price: 1)
  invoice_item = create(:invoice_item, item: item3, invoice: invoice8, quantity: 30, unit_price: 1)
  invoice_item = create(:invoice_item, item: item3, invoice: invoice9, quantity: 11, unit_price: 1)


  transaction = create(:transaction, invoice: invoice1, result: "success")
  transaction = create(:transaction, invoice: invoice2, result: "failed")
  transaction = create(:transaction, invoice: invoice3, result: "success")
  transaction = create(:transaction, invoice: invoice4, result: "success")
  transaction = create(:transaction, invoice: invoice5, result: "success")
  transaction = create(:transaction, invoice: invoice6, result: "success")
  transaction = create(:transaction, invoice: invoice7, result: "success")
  transaction = create(:transaction, invoice: invoice8, result: "success")
  transaction = create(:transaction, invoice: invoice9, result: "success")


  end

  it "can display merchant with most revenue" do
    get "/api/v1/merchants/most_revenue?quantity=1"
    json = JSON.parse(response.body, symbolize_name: true)

    expect(json['data'][0]['attributes']['name']).to eq("#{@merchant2.name}")
  end

  it "can display the merchant with the most items" do
    get "/api/v1/merchants/most_items?quantity=1"
    json = JSON.parse(response.body, symbolize_names:true)

    expect(json[:data].first[:attributes][:name]).to eql("#{@merchant3.name}")
  end

  it "can display the total revenue for a range of dates" do
    get "/api/v1/revenue?start=2012-03-09&end=2012-03-24"
    json = JSON.parse(response.body, symbolize_name: true)

    expect(json['data'].first['attributes']['revenue']).to eql(1196)


  end
end
