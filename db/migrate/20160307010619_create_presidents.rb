class CreatePresidents < ActiveRecord::Migration
  def change
    create_table :presidents do |t|
      t.string :name
      t.string :image
      t.string :url

      t.timestamps null: false
    end
  end
end
