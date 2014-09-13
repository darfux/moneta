def gen_db
  ActiveRecord::Schema.define do
      create_table :words do |table|
          table.column :spell, :string
          table.column :us_phonetic, :string
          table.column :uk_phonetic, :string
          table.column :explains, :string
          table.column :category_id, :integer
          table.column :level, :integer
          table.timestamps
          table.index :spell
          table.index :category_id
      end
      create_table :categories do |table|
          table.column :name, :string
          table.column :description, :string
          table.timestamps
          table.index :name
      end
  end
end