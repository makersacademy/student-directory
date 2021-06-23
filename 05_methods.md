# 5. Methods

[Back to README](README.md)

It's time to further improve our code, now we want to make our program easier to read. We can achieve that by creating a few methods (:pill: [Methods](https://github.com/makersacademy/pre_course/blob/main/pills/methods.md))

````ruby
#let's put all students into an array
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

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
````

Let's start by discussing why we've done it in the first place and then talk about how it works.

Now that we have extracted the code into the methods, the body of our program reads almost like English. First, we print the header. Then we print the list of students. Finally, we print the footer. It's easy to see what's going on without looking at the implementation.

Note that we are now passing the students variable to the methods as an argument (called "names" in both cases). This is because the methods don't have access to local variables defined outside them.

Make sure everything is still working and let's [check the code in](http://gitref.org/basic/#commit). Are you using good commit messages?

[Next: Adding more information about the student](06_adding_more_info.md)
