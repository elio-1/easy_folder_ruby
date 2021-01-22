#Create a method to check if the user has specify an input
def check_if_user_gave_input
  abort("folder name > missing input") if ARGV.empty? 
end
# Gonna une the method just above and get the user input
def get_folder_name
  check_if_user_gave_input
  return folder_name = ARGV.first
end

#This method will create all the folders lib, le spec, le Gemfile avec les bonnes gemmes, rspec --init, git init
def folder(name)
  Dir.mkdir(name) #create the folder
  Dir.chdir(name)  #go INSIDE the folder
  system("cat << EOF > Gemfile 
source 'https://rubygems.org'
ruby '2.7.1'
gem 'nokogiri'
gem 'rspec'
gem 'pry'
gem 'dotenv'
gem 'rubocop', '~> 0.57.2'
EOF")  # create the gemfile with the content inside
  Dir.mkdir("lib")
  Dir.mkdir("spec")
  system("git init")
  system("rspec --init")
  system("cat << EOF > README.md 
This is a ruby file !
EOF")
  system("echo '.env' > .gitignore")
  system("touch .env")
  
    
end


folder(get_folder_name)

