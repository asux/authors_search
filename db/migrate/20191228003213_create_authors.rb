class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :website
      t.string :headings, array: true, default: []

      t.timestamps
    end
  end
end
