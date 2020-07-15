require "rails_helper"


  describe "Items and Merchants search results" do

    before :each do
      create(:merchant, name: 'ReI Recreation', created_at: 'Sat, 01 Aug 2020 12:00:00 UTC +00:00', updated_at: 'Sat, 01 Aug 2020 12:00:00 UTC +00:00')
      create(:merchant, name: "The Fuzzies", created_at: 'Sun, 02 Aug 2020 12:00:00 UTC +00:00', updated_at: 'Sun, 02 Aug 2020 12:00:00 UTC +00:00')
      create(:merchant, name: "Sky diving R us", created_at: 'Mon, 03 Aug 2020 12:00:00 UTC +00:00', updated_at: 'Mon, 03 Aug 2020 12:00:00 UTC +00:00')
      create(:merchant, name: "Blue Twoes", created_at: 'Tues, 04 Aug 2020 12:00:00 UTC +00:00', updated_at: 'Tues, 04 Aug 2020 12:00:00 UTC +00:00')
      create(:merchant, name: "Blue Dog", created_at: 'Wed, 05 Aug 2020 12:00:00 UTC +00:00', updated_at: 'Wed, 05 Aug 2020 12:00:00 UTC +00:00')
    end

    it "can search for single matching merchant attribute with caps and only part of name" do

      get "/api/v1/merchants/find?name=REI"
      json = JSON.parse(response.body, symbolize_name: true)


      expect(json['data']['attributes']['name']).to eq('ReI Recreation')


    end

    it "it will return two results if matching name" do
      get "/api/v1/merchants/find?name=Blue"
        json = JSON.parse(response.body, symbolize_name: true)


        expect(json['data']['attributes']['name']).to eq('Blue Twoes')

    end

    it "can search for updated_at merchants" do
      get "/api/v1/merchants/find?updated_at=01"
      json = JSON.parse(response.body, symbolize_name: true)
      expect(json['data']['attributes']['name']).to eq('ReI Recreation')
    end


    it "it can search two merchant attributes" do
      get "/api/v1/merchants/find?updated_at=01&name=fuzz"
      json = JSON.parse(response.body, symbolize_name: true)

        expect(json['data']['attributes']['name']).to eq('The Fuzzies')
    end

    it "can search find all merchants matching an attribute" do
      get "/api/v1/merchants/find_all?name=blue"
      json = JSON.parse(response.body, symbolize_name: true)

      expect(json['data'].first['attributes']['name'].to eq('Blue Twoes'))
      expect(json['data'].last['attributes']['name'].to eq('Blue Dog'))
    end

    it "can search for item date" do

    end

    it "can search for all matching items for attribute" do

    end

    it "can search for all matching merchants for attribute" do

    end

    it "can search using a date for all attributes" do

    end

  end
