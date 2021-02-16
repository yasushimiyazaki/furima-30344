FactoryBot.define do
  factory :order do
    postal_code { '111-1111' }
    prefecture_id { 1 }
    city          { 'ああああ' }
    addresses     { 'ああああ' }
    building      { 'ああああ' }
    phone_number  { '09011112222' }
    order         { '1' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
