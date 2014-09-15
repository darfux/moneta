def gen_db
  ActiveRecord::Schema.define do
      create_table :words do |t|
          t.column :spell, :string
          t.column :us_phonetic, :string
          t.column :uk_phonetic, :string
          t.column :explains, :string
          t.column :level, :integer
          t.column :last_preview, :datetime
          t.timestamps
          t.index :spell
      end
      create_table :tags do |t|
          t.column :name, :string
          t.column :description, :string
          t.timestamps
          t.index :name
      end
      create_table :tags_words, id: false do |t|
        t.belongs_to :word
        t.belongs_to :tag
      end
      create_table :tag_hierachies, id: false do |t|
        t.belongs_to :parent
        t.belongs_to :child
      end
  end
end