require "rails_helper"


describe "Merchant Items API request" do
  it "Sends a list of items for a given merchant" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    create(:item, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant2.id)
    create(:item, merchant_id: merchant2.id)
    create(:item, merchant_id: merchant2.id)

    get "/api/v1/merchants/#{merchant1.id}/items"
    expect(response).to be_successful

    parsed_json = JSON.parse(response.body, symbolize_name: true)

    expect(parsed_json['data'].count).to eq(3)


  end
end
