require "rails_helper"


describe "Item Merchant API request" do
  it "Sends a merchant for a given item" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    item2 = create(:item, merchant_id: merchant1.id)
    item3 = create(:item, merchant_id: merchant1.id)
    item4 = create(:item, merchant_id: merchant2.id)
    item5 = create(:item, merchant_id: merchant2.id)
    item6 = create(:item, merchant_id: merchant2.id)

    get "/api/v1/items/#{item1.id}/merchants"
    expect(response).to be_successful

    parsed_json = JSON.parse(response.body, symbolize_name: true)
    
    expect(parsed_json['data'].count).to eq(1)


  end
end
