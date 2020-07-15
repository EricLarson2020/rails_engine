require "rails_helper"
describe 'Business API Endpoints' do
  before(:each) do
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant)
    @merchant3 = create(:merchant)

    @item1 = create(:item, merchant: @merchant1, unit_price: 1.50)
    @item2 = create(:item, merchant: @merchant1, unit_price: 3.00)
    @item3 = create(:item, merchant: @merchant2, unit_price: 5.25)
    @item4 = create(:item, merchant: @merchant2, unit_price: 5.50)
    @item5 = create(:item, merchant: @merchant3, unit_price: 15.30)

    @invoice1 = create(:invoice, merchant: @merchant1, created_at: '2012-03-20 14:54:09 UTC')
    @invoice2 = create(:invoice, merchant: @merchant1, created_at: '2012-03-27 14:54:09 UTC')
    @invoice3 = create(:invoice, merchant: @merchant2, created_at: '2012-03-27 14:54:09 UTC')
    @invoice4 = create(:invoice, merchant: @merchant2, created_at: '2012-03-24 14:54:09 UTC')
    @invoice5 = create(:invoice, merchant: @merchant3, created_at: '2012-03-27 14:54:09 UTC')
    @invoice6 = create(:invoice, merchant: @merchant3, created_at: '2012-03-29 14:54:09 UTC')

    @invoice_item1 = create(:invoice_item, item: @item1, invoice: @invoice1, quantity: 1, unit_price: 1.50)
    @invoice_item2 = create(:invoice_item, item: @item2, invoice: @invoice1, quantity: 1, unit_price: 3.00)
    @invoice_item3 = create(:invoice_item, item: @item3, invoice: @invoice2, quantity: 1, unit_price: 5.25)
    @invoice_item4 = create(:invoice_item, item: @item3, invoice: @invoice3, quantity: 1, unit_price: 5.25)
    @invoice_item5 = create(:invoice_item, item: @item4, invoice: @invoice4, quantity: 1, unit_price: 5.50)
    @invoice_item6 = create(:invoice_item, item: @item5, invoice: @invoice5, quantity: 1, unit_price: 15.30)

    @transaction1 = create(:transaction, invoice: @invoice1)
    @transaction2 = create(:transaction, invoice: @invoice2, result: 'failed')
    @transaction3 = create(:transaction, invoice: @invoice3)
    @transaction4 = create(:transaction, invoice: @invoice4)
    @transaction5 = create(:transaction, invoice: @invoice5)
  end

  it "can display merchant with most revenue" do
end
