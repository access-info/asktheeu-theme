# Install hook code here

full_path = File.expand_path(File.join(File.dirname(__FILE__), "public"))

puts `ln -s #{full_path} #{File.join(RAILS_ROOT, 'public', 'asktheeu-theme')}`
