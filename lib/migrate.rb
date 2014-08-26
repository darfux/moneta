def gen_db
  ActiveRecord::Schema.define do
      create_table :words do |table|
          table.column :word, :string
          table.column :us_phonetic, :string
          table.column :uk_phonetic, :string
          table.column :explains, :string
          table.timestamps
          table.index :word
      end
  end
end