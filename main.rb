require './lib/db_connect'
require './lib/migrate'
require './lib/word'
require './lib/net'
unless Word.table_exists?
  gen_db
end

def record_word
  puts "====Word Record(-e to return)===="
  loop do
    print "Enter the new word:"
    word = gets
    word = word.chomp.chomp
    break if word=='-e'
    result = query_word word
    if result
      w = Word.new result
      if w.save
        puts "\tRecord successfully!"
      else
        puts "\t#{w.errors.full_messages}"
      end
    end
  end
end

def list_words
  Word.all.each do |word|
    puts word.word
  end
  loop do
    command = gets
  end
end
loop do
  print 'Enter your command:'
  command = gets
  case command.chomp.chomp
  when 'r'
    record_word
  when 'l'
    list_words
  end  
end

