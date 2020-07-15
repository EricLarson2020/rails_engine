FactoryBot.define do
  factory :invoices do
    status { 'shipped' }
    merchant
    customer
  end
end
