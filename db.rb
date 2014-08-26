require 'active_record'
 
ActiveRecord::Base.logger = Logger.new(STDERR)
# ActiveRecord::Base.colorize_logging = false
 
ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database  => "words.sqlite3"
)
 
ActiveRecord::Schema.define do
    create_table :words do |table|
        table.column :word, :string
        table.column :us_phonetic, :string
        table.column :us_phonetic, :string
        table.column :uk_phonetic, :string
        table.column :explains, :string
    end
end
