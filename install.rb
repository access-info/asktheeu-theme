# Install hook code here

#if RAILS_MODE == 'developemnt' do 
	full_path = File.expand_path(File.join(File.dirname(__FILE__), "public"))

	# TODO: check for existence
	puts `ln -s #{full_path} #{File.join(RAILS_ROOT, 'public', 'asktheeu-theme')}`
