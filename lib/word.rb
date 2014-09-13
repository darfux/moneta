class Word < ActiveRecord::Base
  validates_uniqueness_of :spell
  belongs_to :category
  def show
    "[#{spell}] @#{category.name}\n"\
    "\tus_phonetic:  #{us_phonetic},\n"\
    "\tuk_phonetic:  #{uk_phonetic},\n"\
    "\texplains:     #{explains}"
  end
end