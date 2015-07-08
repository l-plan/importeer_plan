class CreateAdresSource < ActiveRecord::Migration
  def change
    create_table :adres_sources do |t|
      t.string :straat
      t.string :nr_add
      t.string :land
      t.string :plaats
      t.string :postcode
      t.integer :nr
      t.boolean :do_not_check
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :adres_sources, :straat
    add_index :adres_sources, :nr_add
    add_index :adres_sources, :land
    add_index :adres_sources, :plaats
    add_index :adres_sources, :postcode
    add_index :adres_sources, :nr
    add_index :adres_sources, :do_not_check
  end
end
