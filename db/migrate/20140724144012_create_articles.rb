class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.references :user
    end

    add_index :articles, :user_id, unique: true
  end
end
