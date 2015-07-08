class CreateAdres < ActiveRecord::Migration
  def change
    create_table :adressen do |t|
      t.integer :label
      t.integer :adresverwijzing_id
      t.string :adresverwijzing_type
      t.integer :adres_source_id
      t.date :van
      t.date :tot
      t.boolean :ongeldig
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :adressen, :label
    add_index :adressen, :adresverwijzing_id
    add_index :adressen, :adresverwijzing_type
    add_index :adressen, :adres_source_id
    add_index :adressen, :van
    add_index :adressen, :tot
    add_index :adressen, :ongeldig
  end
end
