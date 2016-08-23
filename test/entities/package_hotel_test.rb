require 'response_mocks'
require 'test_helper'

describe ExpediaApi::Entities::PackageHotel do
  let(:client) { ExpediaApi::Client.new }
  let(:sample_arguments) do
    {
      from_date: Date.parse("2016-09-07"),
      to_date: Date.parse("2016-09-15"),
      from_airport: "HAM",
      to_airport: "SYD",
      hotel_ids: [1337]
    }
  end

  let(:hotels_json) do
    JSON.parse(response_list.response.body).with_indifferent_access[:HotelList][:Hotel][0]
  end

  let(:response_list) {
    stub_request(:get, "http://ews.expedia.com/wsapi/rest/package/v1/search/2016-09-07/HAM/SYD/2016-09-15/SYD/HAM?format=json&hotelids=1337&key=test").
    to_return(:status => 200, :body => ResponseMocks.package_search_multiple_stops_many_hotels.to_json, :headers => {})
    client.search_packages(sample_arguments)
  }

  let(:entity) { ExpediaApi::Entities::PackageHotel.new(hotels_json) }

  describe "#initialize" do
    it "creates a new package hotel object" do
      assert_equal ExpediaApi::Entities::PackageHotel, ExpediaApi::Entities::PackageHotel.new({}).class
    end
  end

  describe "#id" do
    it "returns the id of the hotel" do
      assert_equal 18811, entity.id
    end
  end

  describe "#raw_data" do
    it "returns the raw data of the hotel" do
      assert_equal ActiveSupport::HashWithIndifferentAccess, entity.raw_data.class
    end
  end

  describe "#price" do
    it "returns the total hotel price" do
      price = 1234.79
      assert_equal price, entity.price.to_f
    end
  end

  describe "#promotion" do
    it "returns the total promotion" do
      assert_equal 304.58, entity.promotion.to_f
    end
  end

  describe "#room_type_description" do
    it "returns a string or nil" do
      assert_equal true, [NilClass, String].include?(entity.room_type_description.class)
    end
  end

  describe "#room_amenity_list" do
    it "returns an array" do
      assert_equal Array, entity.room_amenity_list.class
    end
  end


end
