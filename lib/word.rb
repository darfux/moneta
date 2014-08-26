class Word < ActiveRecord::Base
  I18n.enforce_available_locales = false
  validates_uniqueness_of :word
end