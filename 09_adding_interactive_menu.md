# 9. Adding an interactive menu

[Back to README](README.md)

Right now our script is interactive, that is, it asks for the user input and prints it back. Later in this tutorial we'll add more sophisticated functionality: saving data to a file and loading it back, showing information about a particular student, etc. Let's start by creating an interactive menu that will ask the user what to do.

Every time you want to write a piece of code, describe how it works to yourself, your pairing partner (or even your [teddy bear](http://blog.adrianbolboaca.ro/2012/12/teddy-bear-pair-programming/)/[rubber duck](http://c2.com/cgi/wiki?RubberDucking)/[cat](http://i0.wp.com/agilescout.com/wp-content/uploads/2011/06/agile-pair-programming-cat-computer.jpg?w=800)) in plain English. It often helps to understand what your code needs to do, saving you lots of time.

So let's talk through how our interactive menu will work in the first place. Firstly, we'll need to show the user a list of possible options. If the user doesn't know what our program can do, how could he or she make a choice? For example, right now our program can input the list of students from the keyboard and print them on the screen.

Secondly, after we have shown the list of possible options, we need to ask the user what to do next. At this point we'll read the user input and execute the action. So, if the user wants to show the list of students, we'll do it.

Finally, we need to go back to step one instead of exiting the program. Otherwise our program will be able to do only one action and it won't be very useful.

So, a method that does it could look like this if we described what we want to do using comments:

````ruby
def interactive_menu  
  # 1. print the menu and ask the user what to do
  # 2. read the input and save it into a variable
  # 3. do what the user has asked
  # 4. repeat from step 1
end
````

Let's convert them into real Ruby code. Instead of starting with the first action, though, let's start with the last one: repeating the code from line 1, so that the user could make multiple selections.

If we need to repeat a certain action a number of times, we need a loop. In this program, we need to keep asking for the user input indefinitely (until the program terminates), so a simple loop is a good choice (:pill: [Loops](https://github.com/makersacademy/pre_course/blob/main/pills/loops.md) ) ).

````ruby
def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    # 2. read the input and save it into a variable
    # 3. do what the user has asked
  end
end
````

You already know how to print something, so the first step isn't a problem.

````ruby
#1. print the menu and ask the user what to do
puts "1. Input the students"
puts "2. Show the students"
puts "9. Exit" # 9 because we'll be adding more items
````

You also know how to save the input into a variable:

````ruby
#2. read the input and save it into a variable
selection = gets.chomp
````

Finally, we need to do some action based on what the user has asked us to do. A switch statement might be helpful in this case… (:pill:  [Control Flow](https://github.com/makersacademy/pre_course/blob/main/pills/control_flow.md) )

````ruby
#3. do what the user has asked
case selection
  when "1"
    # input the students
  when "2"
    # show the students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
end
````

We already have methods for inputting the students and showing them, so we can move them here.

````ruby
#3. do what the user has asked
case selection
  when "1"
    students = input_students
  when "2"
    print_header
    print(students)
    print_footer(students)
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
end
````

This is what the `interactive_menu` method should look like at this point.

````ruby
def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end
````

Note that we declared the variable `students` before the loop setting it to an empty array. We've done it so that it was available in several iterations of the loop. If we didn't do it, it would be set in the first iteration (if we entered some students) but it wouldn't exist on the second iteration. To make it persist across different iterations, we need to declare it outside the loop.

Now update your program to call `interactive_menu` method instead of asking for the list of users straight away and see if it works in the command line.

Our code isn't perfect (we'll discuss why and fix it later) but it works - if it doesn't, try to understand why by reading the error messages and fix it. Don't wait until the code is perfect: if it works, [check it in](http://gitref.org/basic/#commit) and refactor later.

[Next: More refactoring](10_more_refactoring.md)
