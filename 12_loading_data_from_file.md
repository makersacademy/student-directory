# 12. Loading the data from the file

[Back to README](README.md)

If we have the data saved to the file, we can load it on startup, so that we didn't have to input all the students again. The loading procedure is going to be the reverse of the what we've done to save the data to the file.

First, we need to open the file for reading. Then, we'll read the contents of the file, iterate over all lines, split every line at the comma and put a new hash into the array `@students`. Finally, we'll close the file.

Before writing the code, let's talk about different file access modes. When we opened the file for writing in the previous section, we did this:

````ruby
File.open("students.csv", "w")
````

The second argument is the file access mode. When you're accessing a file, you need to specify what you intend to do with it: read, write, read and write, append to it, etc. You need to do this so that other programs could access the file, if it's possible. For example, the same file can be opened simultaneously by several programs in "read only" mode but only one can open it in the "write" mode.

It makes sense: if several programs would open a file in write mode at the same time, what changes would be saved on the disk? The situation would be unpredictable. So the operating system (Ruby simply delegates opening the file to the operating system) doesn't allow to open the files if there's a possibility of a conflict.

You can read about different modes that Ruby allows in [the documentation](http://www.ruby-doc.org/core-2.0.0/IO.html#method-c-new-label-IO+Open+Mode). When you need to access the file, choose the most appropriate file access mode and use it.

Now let's load the students from the file.

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

So, we open the file (this time for reading), then we read all lines into an array and iterate over it. On every iteration we discard the training new line character from the line, split it at the comma (this will give us an array with two elements) and assign it to the `name` and `cohort` variables. Once we have the name and the cohort, we create a new hash and put it into the list of students. Finally, we close the file.

There are a couple of new things happening here. First, we're doing a parallel assignment on line 4. This means that we are assigning two variables at the same time. If the assigned value is an array, then the first variable will get the first value of the array, the second variable – the second value and so on.

In our file every line has one comma, so if we split the line at this comma, we'll get an array with two values. The first one will become the name and the second one will become the cohort (:pill: [parallel assignment](https://github.com/makersacademy/pre_course/blob/main/pills/parallel_assignment.md)).

On the next line we create a new hash and put it in the array of students using the shovel operator (:pill: [shovel operator](https://github.com/makersacademy/pre_course/blob/main/pills/shovel_operator.md)). The only thing that's different from the `input_students()` method that does the same operation is that here we're converting a string that we read from the file to a symbol (`cohort.to_sym`). We do it for consistency: if we have decided to store the cohort as a symbol, so let's not change the format.

If you now update the `print_menu()` and `process()` methods, your program should be able to load the students from file.

````ruby
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end
````

If everything works as it should, it's a good time to commit what you've done so far.

[Next: Taking arguments from the command line](13_taking_arguments_command_line.md)
