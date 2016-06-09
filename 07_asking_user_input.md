## Asking for user input

Let's ask the user for the list of students instead of hardcoding them into the script. So we'll create an empty array of students and then ask the user for the first name and put it into the array. Then we'll ask for the second name and put it into the array. Then we'll ask for the third name and so on, until the user enters an empty name, at which point we'll just show the list of students. Sounds easy, right?  (:pill: [user interaction](https://github.com/makersacademy/pre_course/blob/master/pills/user_interaction.md) )

The method we're about to write (**no copy and pasting, as usual**) is going to be the most complex yet but don't worry, we'll break it down line by line.

````ruby
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do    
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
````

Now, instead of hardcoding the list of students, let's get it from the user:

````ruby
students = input_students
print_header
print(students)
print_footer(students)
````

So, what's going on in the `input_students` method? Firstly, we create an empty array to store our future students (line 5). Then we ask for the name of the first student (line 7) and discard the return character. Then, we write a block of code (lines 9 to 15) that will be executed repeatedly as long as the name variable is not empty (the "empty?" method is part of the String class). If the name the user entered on line 7 is not empty (exclamation mark at the beginning means negation), the block will be executed at least once. If not, it'll be skipped altogether and Ruby will jump to line 17.

Inside the block we know that the name is not empty (otherwise it wouldn't be executed at all). Then we add a new hash to the array (the << is called a :pill:[shovel operator](https://github.com/makersacademy/pre_course/blob/master/pills/shovel_operator.md) and it's used to put things into an array) with the value of the name the user entered corresponding to the key :name. The value of the cohort is hardcoded (see the [list of exercises](08_exercises.md) for some ideas how to change it).

Then we print a line to let the user know how many students have been entered so far and ask for another name. When the current iteration finishes, the next thing that will be evaluated is the condition on line 9. If the user entered an empty name, Ruby will jump to line 17. Otherwise, if we do have a name, it will execute the block again.

Finally, the method will return the array of students that we'll assign to the variable `students` and then pass to other methods for printing on the screen as a list.

````
ruby directory.rb
Please enter the names of the students
To finish, just hit return twice
Dr. Hannibal Lecter
Now we have 1 students
Darth Vader
Now we have 2 students
Nurse Ratched
Now we have 3 students

The students of my cohort at Makers Academy
—————————
Dr. Hannibal Lecter (november cohort)
Darth Vader (november cohort)
Nurse Ratched (november cohort)
Overall, we have 3 great students
````

If everything works as it should, commit the code.

So, our list of students is becoming interactive. Make sure you really understand all code and then try to extend it. See the list of exercises on the next section for some ideas on how to make it better.
