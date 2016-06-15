# 4. Arrays

[Back to README](README.md)

Our code works but it's not perfect. There are two problems here. Firstly, it's repetitive. The same operation – printing the student name – is repeated several times. Every time you see any kind of repetition in code, try to eliminate it because it will result in a hard to maintain code at best or be a source of nasty bugs at worst. For example, if we want to add one more student to our program, do we really have to type "puts" again? What if we had a thousand students? Oh, and we'll need to manually update `student_count`. That's a big red flag.

Secondly, the data (student names) is tightly coupled with what we do with this data (printing it). What if we wanted to change the way the students are printed, for example putting a number in front of the name? That'd mean updating every single line that prints a student name. What if we wanted to print the list twice: first in alphabetical order, then in reverse order? You can see how quickly it can all go wrong.

Arrays (:pill: [Arrays](https://github.com/makersacademy/pre_course/blob/master/pills/arrays.md) ) will help us avoid both of these problems. Let's start by putting the students into an array. Remember, don't copy-paste, type everything in yourself, it's important. Make sure you understand every line here: _if you don't, talk to other students or the coaches_.

````ruby
student_count = 11
# let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# and then print them
puts "The students of Villains Academy"
puts "-------------"
puts students[0]
puts students[1]
puts students[2]
puts students[3]
puts students[4]
puts students[5]
puts students[6]
puts students[7]
puts students[8]
puts students[9]
puts students[10]
# finally, we print the total
puts "Overall, we have #{student_count} great students"
````

Now run the code. It still does exactly the same thing as before, right? However, if still suffers from the same problems that we discussed above. Why did we put the students into an array then? Because now we can actually improve our code.

Let's start with a student count. Now that our students are in an array, we can use the array's `count()` method to count them instead of doing it manually. Get rid of the `student_count` variable and update the last line:

````ruby
puts "Overall, we have #{students.count} great students"
````

Now if we put one more student in the array, we won't have to update the `student_count` variable. That's really good news.

What about the repetition? There's a way to print every value in the array without referring to each value individually. It's [iteration](https://en.wikipedia.org/wiki/Iteration#Computing), baby! Doing some operation on every value of an array is called iterating and one such operation is called an iteration. So if we need to print every value of an array, we need to iterate over this array and print the current value on every iteration. Makes sense? Let's see what the code would look like. Instead of `puts students[0]` ... `puts students[8]` you can do this:

````ruby
students.each do |student|
  puts student
end
````

This code takes every name from the array `students` and for each name it executes the block of code between `do` and `end`. Every execution of this block of code is called an iteration. On every iteration, the current name will be assigned to the value `student` that we specified between two vertical bars.

So, on the very first iteration, it will take the first value from the array ("Dr. Hannibal Lecter") and assign it to the variable `student`. Then, it will execute the block of code (`puts student`) that will print it to the screen. Since "Dr. Hannibal Lecter" is not the last person in our array of charming students, Ruby will perform the second iteration, assigning the value of "Darth Vader" to the variable `student` and printing it again.

Now our program is much shorter.

````ruby
# let's put all students into an array
students = [
	"Dr. Hannibal Lecter",
	"Darth Vader",
	"Nurse Ratched",
	"Michael Corleone",
	"Alex DeLarge",
	"The Wicked Witch of the West",
	"Terminator",
	"Freddy Krueger",
	"The Joker",
	"Joffrey Baratheon",
	"Norman Bates"
]
# and then print them
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
	puts student
end
# finally, we print the total
puts "Overall, we have #{students.count} great students"
````

By doing this we have solved two problems. Firstly, we separated the data (the array) from the operation on this array (line 19). This means that if we want to print this array again, it's very easy to do. It also means that if we want to add one more student, we won't have to do anything other than adding one more name to the array. On top of that, we could get rid of the `student_count` variable.

Secondly, we got rid of the repetition. This means that if we want to change the way this array is printed, there's only one line to update, line 19.

It's certainly a good time to commit the code.

[Next challenge](05_methods.md)
