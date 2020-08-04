# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email,    null: false
      t.string :name,     null: false
      t.string :surname,  null: true
      t.string :avatar,   null: true
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false
    end
  end
end
