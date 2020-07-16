class RevenueSerializer
  include FastJsonapi::ObjectSerializer

  attribute :revenue do |object|
    object.attributes["revenue"] if object.attributes["revenue"]
  end

end
