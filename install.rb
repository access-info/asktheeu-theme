# Install hook code here

#if RAILS_MODE == 'developemnt' do 
	full_path = File.expand_path(File.join(File.dirname(__FILE__), "public"))

puts "=======#{Rails.configuration.root_path}"
	# TODO: check for existence
	puts `ln -s #{full_path} ../../../public/asktheeu`
