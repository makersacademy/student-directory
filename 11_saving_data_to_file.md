## Saving the data to a file

Right now our students disappear every time we terminate the program because the data is stored in memory. Let's persist it to the disk every time the user enters a new student. We'll store the data in a text file in the same directory where the program is. We'll use the [comma-separated format (CSV)](http://en.wikipedia.org/wiki/Comma-separated_values) to store the data. So, our file will look like this:

````csv
Dr. Hannibal Lecter,november
Darth Vader,november
````

and so on. Let's see how we could save the list of students to a file.

````ruby
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
````

Let's discuss this piece of code in detail. If we want to write to a file in Ruby, we need to "open" the file first. This is very similar to opening a file in a normal text editor, e.g. Atom. When we open a file, the `open()` method returns us a reference to the file that we can save it a variable called "file". Then we iterate over the array of students, processing one student at a time.

On every iteration we create a new array with the student name and the cohort, that is, the information we want to save to the file. We do this in order to convert it to a comma-separated string on the next line. The `join()` method joins all elements of the array it's called on together, using its argument as a separator. Finally, we write the csv line to the file using the familiar `puts()` method, except we call it on a file, so it writes to the file and not on the screen.

If the previous paragraph wasn't confusing, you're doing really well! If it was, don't worry, we'll discuss it again. So, on every iteration we want to write a line like this to the file:

````
Dr. Hannibal Lecter,november
````

However, our data is stored in a hash, right? So, we need to convert this hash to a string to write to the file. An easy way to do it is to put all elements of the hash into an array and then convert it all to the string. So, on line 6 we'll create an array like this:

````ruby
["Dr. Hannibal Lecter", :november]
````

Then, on line 7 we'll join it all together using comma as a separator:

````
"Dr. Hannibal Lecter,november"
````

Then, on line 8 we write this line to the file using the method `puts()`. Finally, after we save all students to the file, we close it on line 10. Every time you open file, it needs to be closed.

We've just used a few new methods that you might not be familiar with yet. Google their names to find more about them. Just searching ["ruby file open"](http://www.google.com/?q=ruby%20file%20open#q=ruby+file+open) or ["ruby array join"](https://www.google.com/?q=ruby%20file%20open#q=ruby+array+join) will give you want you need as the first result. Read the documentation for these methods to learn more about them. For example, what does the second argument to `File.open` mean? Most importantly, play with these methods in `irb`. Create an array, then combine it into a string with `join()` using various separators. This is the best way to learn.

Allow us to digress from writing files for a second. As a developer, you need to be able to solve unknown problems on a daily basis, read and understand code written by other people, learn new languages and methods, etc. The main goal of this section is not to show that when you need to write something to a file, you need to call the method `open()` of the class File and then combine the data using the method join() from the class Array. These are insignificant details. Instead, you need to read the piece of code above, understand it, google the methods used and remember that the files must be opened and closed (how exactly to do it doesn't matter, you can always google it in a second). Also, you need to remember that if you need to write an array of data, you would normally iterate over this array and write a piece of data on every iteration. Don't worry about how exactly to do it: it's easy to look up. Overall, strive to understand things conceptually and learn how to find answers instead of memorising them.

So, back to writing files. Why did we use the method `puts()` to write to a file. Actually, this is a Ruby method that can be used in various situations. When we call it on its own, without any file reference, Ruby assumes that we want to write to standard output (:pill: [The command line](https://github.com/makersacademy/pre_course/blob/master/pills/command_line.md)). So, these two lines are equivalent:

````ruby
puts "Hello"
STDOUT.puts "Hello"
````

However, if we want to write to a file, instead of the output stream, we need to call it explicitly.

````ruby
file.puts "This is written to a file"
````

You can inspect the file using Atom to make sure it looks correct.

Finally, let's add one more menu item to save the students if we want to.

````ruby
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end
````

You'll also need to add one more case in the `process()` method.

````ruby
when "3"
  save_students
````

Check that everything works as expected and commit the `directory.rb` file.

However, what about the students.csv file we have in our project directory? It's not part of the codebase, so it shouldn't be checked in at all. However, if we do "git status", it will be shown as untracked.

````
git status
# on branch master
# Changes to be committed:
#    (use “git reset HEAD <file>…” to upstage)
#         modified: directory.rb
#
# Untracked files:
#    (use “git add <file>…” to include in what will be committed)
#
#       students.csv
````

We want to tell git to ignore this file completely, as if it didn't exist. To do this, create a `.gitignore` file (starting with a dot) and put the name of the file you want to ignore in it.

Now the csv file will be ignored by git. However, you'll need to add the `.gitignore` file itself to your project.
