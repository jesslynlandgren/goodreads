class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.bigint :goodreads_id
      t.string :name
      t.string :image_url
      t.text :about

      t.timestamps
    end
    create_table :books do |t|
      t.bigint :goodreads_id
      t.string :name
      t.references :author
      t.text :summary

      t.timestamps
    end
  end
end
