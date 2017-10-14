class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :maker
      t.string :wine_type
      t.string :region
      t.string :vintage
      t.string :price
      t.integer :rating
      t.integer :user_id
    end
  end
end
