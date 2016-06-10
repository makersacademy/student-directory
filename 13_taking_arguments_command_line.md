# 13. Taking arguments from the command line

[Back to README](README.md)

Right now, the list of students is loaded from the file if you select the corresponding option from the menu. What if we wanted to load the information from the file on startup? Let's learn how to read command-line arguments and use them.

When you run a program in the terminal, you can pass arguments to it. You've done it many times by now. For example, when you change to a parent directory,

````
cd ..
````

you are executing a program called `cd` and you're passing `..` as an argument, so that it knows what directory to change into. An argument here is very similar to an argument you're giving to a method. For example, if you wanted to change the current directory from Ruby, you'd do

````ruby
Dir.chdir('..')
````

Programs can use arguments passed to them on startup, just like methods have access to their own arguments. In case of methods, the arguments are usually (but not always) named in advance, for example:

````ruby
def convert(amount, original_currency, target_currency)
end
````

So we know in advance that we'll get exactly three arguments that we'll be referring to as `amount`, `original_currency` and `target_currency`. When a program is launched, there's no way of knowing how many arguments will be passed to it, let alone their names. Therefore, we have to access them by their index.

If our program is launched, the special [`ARGV`](http://jnoconor.github.io/blog/2013/10/13/a-short-explanation-of-argv/) array will contain all the arguments. So, if we run

````
ruby directory.rb foo bar
````

the `ARGV` array will contain the arguments:

````ruby
puts ARGV.inspect #=> ["foo", "bar"]
````

This allows us to use the command-line arguments to load the data from the file on startup. If we pass the filename as an argument, we can load the data from there automatically:

````
ruby directory.rb students.csv
````

The argument, `students.csv`, will be the first and only element in the `ARGV` array. We'll be able to access it like this

````ruby
ARGV.first
````

So, let's load the data from the file on startup, if the file is present. We already have a method to load students from a file:

````ruby
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
````

This method has the filename hardcoded into it. To make it work with arbitrary filenames, we need to make the method more flexible by passing the name as the argument. However, to preserve the original functionality, let's give it a default value.

````ruby
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
````

So, now the method accepts the filename as an argument. However, if the argument is not supplied, then the value "students.csv" will be used. This value is called the default value for an argument. Providing it allows us to call the method either without the arguments or with one argument:

````ruby
load_students # will load from students.csv by default
load_students(list.txt) # will load from list.txt
````

Let's now load the data if the file is given to the script as an argument. First, we'll need to see if the argument is given. If not, we just proceed as before and don't do anything. Then we need to check if the file exists. If it doesn't, the user must have given us the incorrect file name, so let's show an error message and quit. Finally, if the file is given and it exists, let's load it.

````ruby
def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
````

Look at line 4. We're using a method `exists?()` defined in class File to check if a given file exists. How could you have guessed to use this method if you didn't know about it? First, it's reasonable to assume that Ruby has some methods to check for file existence. We can find it either by googling ["ruby check file exists"](https://www.google.co.uk/search?q=ruby+check+file+exists) (the first result will be a stack overflow question with an answer) or by assuming that this functionality is in the File class that we used before. Again, ["google ruby file"](http://www.google.com/search?q=ruby+file) to find it and then search the page for the word "exist". It must be mentioned in the description of the method that does that. As it turns out, the name of the method is `exists?()`.

Again, your don't need to remember that the method that checks for file existence is `File.exist?()` (although you will, eventually). Instead, you need to learn how to find this method if you don't know its name.

We're almost done with this tutorial. There's one more change we need to make to our program that's related to the way `gets()` works. We use this method to get the input from the keyboard but it actually does something else. It reads from the list of files supplied as arguments, only defaulting to the keyboard (or, standard input stream, to be precise) if there are no files. So, our code will now break unless we tell `gets()` to read specifically from the input stream even if some files have been passed as an argument. Read more about how `gets()` works in its [documentation](http://www.ruby-doc.org/core-2.0.0/Kernel.html#method-i-gets).

So, whenever we use `gets()`, let's specify that it should read from the standard input stream:

````ruby
STDIN.gets
````

Update the `input_students()` and `process()` methods that use the `gets()` method to take the input from standard input.

Now, if you call this method right before showing the menu, it will load the students from the file if it's supplied by the command-line.

If everything works as expected, congrats - you have built a fully functional command line app! :tada:

[Next challenge](14_more_exercises.md)
