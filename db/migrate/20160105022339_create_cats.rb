class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.references :breed
      t.date :born_on
      t.string :image_url

      t.timestamps null: false
    end
  end
end
