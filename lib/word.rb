class Word < ActiveRecord::Base
  validates_uniqueness_of :spell
  has_and_belongs_to_many :tags
  def show
    "[#{spell}] @[#{tags.map{|e| e.name }.join(', ')}]\n"\
    "\tus_phonetic:  #{us_phonetic},\n"\
    "\tuk_phonetic:  #{uk_phonetic},\n"\
    "\texplains:     #{explains}"
  end
end