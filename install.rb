# Install hook code here

plugin_path = File.expand_path(File.join(File.dirname(__FILE__), "public"))
main_app_path = File.join(RAILS_ROOT, 'public', 'asktheeu-theme')

puts "Creating symbolink link from #{main_app_path} to #{plugin_path}..."
puts `ln -s #{plugin_path} #{main_app_path}`
