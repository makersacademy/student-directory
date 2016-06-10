# 6. Adding more information about the student

[Back to README](README.md)

Right now the only information we have about our students is the name. What if we want to know what cohort they belong to? Let's update our students array to be an array of arrays. The nested arrays will have both the name and the cohort month.

````ruby
students = [
  ["Dr. Hannibal Lecter", :november],
  ["Darth Vader", :november],
  ["Nurse Ratched", :november],
  ["Michael Corleone", :november],
  ["Alex DeLarge", :november],
  ["The Wicked Witch of the West", :november],
  ["Terminator", :november],
  ["Freddy Krueger", :november],
  ["The Joker", :november],
  ["Joffrey Baratheon", :november],
  ["Norman Bates", :november]
]
````

Since we changed our data structure, let's also update the `print()` method. We should also rename the argument since we are not passing just names anymore. Note that we're storing the cohort month as a symbol (:pill: [Symbols](https://github.com/makersacademy/pre_course/blob/master/pills/symbols.md)) because we don't expect to treat it as a string (that is, combine it with another string, manipulate individual characters, etc). While you're at it, don't forget to update any other methods that could be using `students` as an argument.

````ruby
def print(students)
  students.each do |student|
    puts "#{student[0]} (#{student[1]} cohort)"
  end
end
````

This gives us a beautiful output:

````
ruby directory.rb
The students of Villains Academy
-------------
Dr. Hannibal Lecter (november cohort)
Darth Vader (november cohort)
Nurse Ratched (november cohort)
Michael Corleone (november cohort)
Alex DeLarge (november cohort)
The Wicked Witch of the West (november cohort)
Terminator (november cohort)
Freddy Krueger (november cohort)
The Joker (november cohort)
Joffrey Baratheon (november cohort)
Norman Bates (november cohort)
Overall, we have 11 great students
````

However, what's the problem with this code? Stop here for a second. Before you read the answer, ask yourself, what's wrong with this line:

````ruby
puts "#{student[0]} (#{student[1]} cohort)"
````

If you guess that it doesn't communicate its intent well enough, you're right. If you read this line in isolation, you can see that it's printing some information about a student but you don't know anything else. Is `student[0]` a name? A first name? A last name? An average grade? Even though you can answer these questions by reading the entire program, you should strive to write code that's easy to understand as it is. 

Let's fix this problem. Let's store the student data not in arrays but in hashes (:pill:  [hashes](https://github.com/makersacademy/course/blob/master/pills/hashes.md) )

````ruby
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
````

Hashes have keys corresponding to values, so instead of referencing the data by index as we've done with arrays (`student[0]`), we can reference them by key:

````ruby
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
````

Now this method is much more readable. Even if you know nothing about the rest of the program, you can tell that for each student from an array of students it prints a name, followed by the cohort.

Now it's a good time to commit the code.

[Next challenge](07_asking_user_input.md)
