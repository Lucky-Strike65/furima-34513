FactoryBot.define do
  factory :order_address do 
    postcode {'111-1111'}
    prefecture_id { 1 }
    city { '網走群大空町' }
    area { '東藻琴' }
    building { '〇〇ビル103' }
    phone_number { '12345678910' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end