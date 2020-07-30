class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer   :author_id, foreign_key: true
      t.string    :title
      t.text      :text
      t.string    :image
      t.datetime  :updated_at, precision: 6, null: false
      t.datetime  :created_at, precision: 6, null: false
    end
    
    add_index :articles, :id
    add_index :articles, :title
    add_index :articles, :author_id
    
  end
end
