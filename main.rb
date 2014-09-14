require './lib/db_connect'
require './lib/migrate'
require './lib/word'
require './lib/category'
require './lib/net'
unless Word.table_exists?
  gen_db
  Category.create(name: 'Default', description: 'The default category')
end

def default_category
  Category.find_by(name: 'Default')
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
      w = Word.new result.merge(category_id: default_category.id, level: 0)
      if w.save
        puts "\tRecord successfully!"
      else
        puts "\t#{w.errors.full_messages}"
      end
    end
  end
end

def list_words
  puts "====Word List===="
  Word.all.each do |word|
    puts word.show
    puts
  end
  # loop do
  #   command = gets
  # end
end

def list_help
  help_info =%q|
    r Record word
    l List exist word
    h Help
    q Query
    e Quit
  |
  puts help_info
end

loop do
  print 'Enter your command:'
  command = gets
  case command.chomp.chomp
  when 'r'
    record_word
  when 'import'
    import_words
  when 'l'
    list_words
  when 'h'
    list_help
  when 'q'
  when 'e'
    exit
  end  
end

