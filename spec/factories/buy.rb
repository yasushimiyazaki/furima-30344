FactoryBot.define do
  factory :buy do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city          { 'ああああ' }
    addresses     { 'ああああ' }
    building      { 'ああああ' }
    phone_number  { '09011112222' }
    token         { 'tok_abcdefghijk00000000000000000' }
    
    
  end
end
