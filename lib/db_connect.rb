require 'active_record'
# ActiveRecord::Base.logger = Logger.new(STDERR)
# ActiveRecord::Base.colorize_logging = false

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database  => "words.sqlite3"
)

module ActiveRecord
  class Base
      I18n.enforce_available_locales = false
  end
end