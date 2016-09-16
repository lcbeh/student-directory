# This is my source code file
# __FILE__ is the magic variable that contains the name of the current file
# $0 is the name of the file which is used to start the program
puts File.read(__FILE__)  # or puts File.read($0)  :)
