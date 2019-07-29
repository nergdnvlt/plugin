# frozen_string_literal: true

FactoryBot.define do
  factory :registration do
    quantity { 1 }
    price { 1.5 }
    license { "MyString" }
    product { nil }
    user { nil }
  end
end
