class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|
      t.string :title
      t.string :url
      t.string :data_type

      t.timestamps
    end
  end
end
