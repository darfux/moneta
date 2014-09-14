def gen_db
  ActiveRecord::Schema.define do
      create_t :words do |t|
          t.column :spell, :string
          t.column :us_phonetic, :string
          t.column :uk_phonetic, :string
          t.column :explains, :string
          t.column :level, :integer
          t.timestamps
          t.index :spell
      end
      create_t :tags do |t|
          t.column :name, :string
          t.column :description, :string
          t.timestamps
          t.index :name
      end
      create_t :tags_words, id: false do |t|
        t.belongs_to :word
        t.belongs_to :tag
      end
      create_t :tag_hierachies, id: false do |t|
        t.belongs_to :parent
        t.belongs_to :child
      end
  end
end