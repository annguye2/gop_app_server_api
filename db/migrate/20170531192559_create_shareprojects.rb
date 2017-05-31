class CreateShareprojects < ActiveRecord::Migration[5.0]
  def change
    create_table :shareprojects do |t|
      t.string :name
      t.string :creator
      t.string :description
      t.string :comment
      t.string :feature_url
      t.string :category

      t.timestamps
    end
  end
end
