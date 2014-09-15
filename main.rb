require 'active_record'
require 'pry'
Dir["./lib/*.rb"].each {|file| require file }

unless Word.table_exists?
  gen_db
  Tag.create(name: 'Default', description: 'The default tag')
end

def single_get(tip)
  print tip
  word = gets
  word.chomp.chomp
end

def default_tag
  Tag.find_by(name: 'Default')
end

def handle_record_word
  puts "====Word Record(-e to return)===="
  loop do
    word = single_get("Enter new word:")
    break if word=='-e'
    case r=record_word(word)
    when true
      puts "Record successfully"
    when -1
      puts "Query failed"
    else
      puts r.full_messages
    end
  end
end

def hanle_add_tag
  tag = Tag.new(name: single_get("Enter new tag:"))
  if tag.save
    puts "Tag added"
  else
    puts tag.errors.full_messages
  end
end


def record_word(word)
  result = query_word word
  if result
    w = Word.new result.merge(level: 0)
      if w.save
        return true
      else
        return w.errors
      end
  else
    return -1
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
    handle_record_word
  when 'import'
    import_words
  when 'l'
    list_words
  when 'h'
    list_help
  when 'at'
    hanle_add_tag
  when 'q'
  when 'e'
    exit
  when 'irb'
    binding.pry
  end  
end

