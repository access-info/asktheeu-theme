# Uninstall hook code here

main_app_path = File.join(RAILS_ROOT, 'public', 'asktheeu-theme')
puts "Deleting symbolink link at #{main_app_path}..."
puts `rm #{main_app_path}`
