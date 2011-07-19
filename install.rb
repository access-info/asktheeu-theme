# Install hook code here

begin
	plugin_path = File.expand_path(File.join(File.dirname(__FILE__), "public"))
	main_app_path = File.join(RAILS_ROOT, 'public', 'asktheeu-theme')

	print "Creating symbolink link from #{main_app_path} to #{plugin_path}... "
	File.symlink(plugin_path, main_app_path)
	puts "done"
rescue NotImplemented
	puts "failed: symbolic links not supported"	
end