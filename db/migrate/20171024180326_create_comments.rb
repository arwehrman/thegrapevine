class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    t.string :content
    t.integer :wine_id
    end
  end
end
