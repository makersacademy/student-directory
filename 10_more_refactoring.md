### Refactoring the code

First of all, why refactor if it works? Refactoring the code means improving its structure without changing its functionality, so that it was easier to understand and extend later. Once you get your code working, stop and think if you could refactor it to make it look good. This work will pay off later when you decide to add a couple more features.

What's wrong with our current code? First of all, the `interactive_menu()` method is too long, taking 24 lines. We should aim to write methods as short as reasonably possible. Under 10 lines is good, under 5 lines is better, 1-3 lines is very good. Let's make this method shorter by extracting a couple of methods from it. We can extract the code that prints the menu into its own method.

````ruby
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items  
end
````

Let's also extract the code that prints the students into a method:

````ruby
def show_students
  print_header
  print(students)
  print_footer(students)
end
````

However, if you probably have noticed that we've just ran into a new problem. The new method `show_students()` needs the variable `students`. However, this variable is local to the method `interactive_menu()` and is, therefore, not accessible here.

One solution would be to pass it to the method as an argument. Another solution is to declare this variable outside all methods, so that it were accessible in all methods. If we do this, the variable will need to start with an "@" symbol. We'll explain why exactly it is so when we get to Object-oriented programming but for now let's just say that we're doing it so that this variable were accessible in all methods. So, put this at the very beginning of the file:

````ruby
@students = [] # an empty array accessible to all methods
````

Now that we've done it, we can stop passing `students` around as an argument and just use this variable in **all** methods.

The last big part of the method is the "case" statement that decides what to do based on what the user entered. Let's extract it into a new method as well.

````ruby
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end
````

Note that we're passing the user selection as an argument to the method. The `input_students()` method isn't returning a list of students since it will work with the `@students` variable now. We don't need to pass the list of students to show_students() for the same reason. Now our interactive_menu() method looks much better.

````ruby
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end
````

I hope you agree that this is much more readable than what we had before. We print the menu and process the user input in an infinite loop. Everything else was teased out into separate methods. One of them doesn't look good, though.

````ruby
def show_students
  print_header
  print(students)
  print_footer(students)
end
````

The method `print()` has a bad name. It's obvious that it prints something but what exactly? Let's rename it to `print_students_list()` and remove the variables passed as arguments since we can now access `@students` from all methods.

````ruby
def show_students
  print_header
  print_students_list
  print_footer
end
````

Now it becomes more readable. Let's commit the code (double check that it works as before). However, the code is not perfect. There are several more opportunities for refactoring this code, as you'll see in the [exercises](13_extra_exercises.md) in the end of this tutorial.

If you would like to see what the code looks like at this stage of the tutorial, [follow this link](https://raw.githubusercontent.com/makersacademy/student-directory-exemplar/596363a7851e8aac5e8ecb669ded57b41d78d50e/directory.rb).
