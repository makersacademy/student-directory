# 3. Refactoring (cleaning the code)

[Back to README](README.md)

Refactoring is the process of improving the code without changing what it does. Let's make our code slightly better by introducing a variable instead of a number on line 16. Why? It's more descriptive. It may not matter much in such a simple example but in more complex programs, numbers used on their own may be a source of confusion. There's a good discussion of these numbers (called magic numbers) and a few code examples in [Wikipedia](http://en.wikipedia.org/wiki/Magic_number_(programming)).

So, let's extract the number 11 into a variable. Define it at the beginning of the file

````ruby
student_count = 11
````

and print it instead of the raw number

````ruby
print student_count
````

Now your code looks like this.

````ruby
student_count = 11
# first, we print the list of students
puts "The students of Villains Academy"
puts "-------------"
puts "Dr. Hannibal Lecter"
puts "Darth Vader"
puts "Nurse Ratched"
puts "Michael Corleone"
puts "Alex DeLarge"
puts "The Wicked Witch of the West"
puts "Terminator"
puts "Freddy Krueger"
puts "The Joker"
puts "Joffrey Baratheon"
puts "Norman Bates"
# finally, we print the total number of students
print "Overall, we have "
# it's important that print() doesn't add new line characters
print student_count
puts " great students"
````

Now line 19 clearly communicates what it does. Let's reduce the line count by two by using interpolation (:pill: [String interpolation](https://github.com/makersacademy/pre_course/blob/master/pills/string_interpolation.md)). Replace the last three lines with this.

````ruby
# finally, we print the total number of students
puts "Overall, we have #{student_count} great students"
````

Now our code is both shorter and more expressive than it was before. Good time to commit it.

[Next: Arrays](04_arrays.md)
