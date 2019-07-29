# frozen_string_literal: true

class AddPathToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :path, :string
  end
end
