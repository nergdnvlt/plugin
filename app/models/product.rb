# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :registrations
  has_many :users, through: :registrations
end
