require "rails_helper"


  describe "Items and Merchants search results" do

    before :each do
      create(:merchant, name: 'ReI Recreation')
      create(:merchant, name: "The Fuzzies")
      create(:merchant, name: "Sky diving R us")
      create(:merchant, name: "Blue Twoes")
      create(:merchant, name: "Blue Dog")
    end

    it "can search for single matching merchant attribute with caps and only part of name" do

      get "/api/v1/merchants/find?name=REI"
      json = JSON.parse(response.body, symbolize_name: true)
      binding.pry

    end

    it "can search for single matching item attribute" do

    end

    it "can search for single matching item attribute with caps" do

    end

    it "can search for single matching merchant attribute with caps" do

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
