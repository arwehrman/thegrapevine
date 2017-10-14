class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :maker
      t.string :type
      t.string :region
      t.string :vintage
      t.decimal :price
      t.integer :rating
      t.integer :user_id
    end
  end
end
