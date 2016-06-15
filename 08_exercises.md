# 8. Exercises

[Back to README](README.md)

Some of them are easy and some are more challenging. If you find yourself struggling, discuss the exercise with other students, pair on it or just do an easy one before coming back to the harder exercise.

1. We're using the `each()` method to iterate over an array of students. How can you modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter"? *Hint: look into each_with_index()*

2. Modify your program to only print the students whose name begins with a specific letter.

3. Modify your program to only print the students whose name is shorter than 12 characters.

4. Rewrite the `each()` method that prints all students using `while` or `until` control flow
methods (:pill: [Loops](https://github.com/makersacademy/pre_course/blob/master/pills/loops.md)).

5. Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.

6. Research how the method `center()` of the `String` class works. Use it in your code to make the output beautifully aligned.

7. In the `input_students` method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?

8. Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the `map()` method may be useful but it's not the only option), iterate over it and only print the students from that cohort.

9. Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student". How can you fix it so that it used singular form when appropriate and plural form otherwise?

10. We've been using the `chomp()` method to get rid of the last return character. Find another method among those provided by the `String` class that could be used for the same purpose (although it will require passing some arguments).

11. Once you have completed the "Asking for user input" section, open [this file](https://raw.githubusercontent.com/anitacanita/student-directory/master/typos.rb). It's Ruby code but it has some typos. Copy it to a local file and open it in Atom without syntax highlighting. To do this, select "Plain Text" in the lower right corner of the window. It should look similar to this:
![rubysyntaxhighlighting](/images/selecting_ruby_syntax_highlighting.png)
 Now, find all typos in that file and correct them. Use your experience, online
 documentation, etc. to find all mistakes. Run the script in the terminal from time to time to make sure it works as it should. Google the errors Ruby will give you, think about what they could mean, try different things but don't look the answer up :)

12. What happens if the user doesn't enter any students? It will try to print an empty list. How can you use an `if` statement (:pill: [Control Flow](https://github.com/makersacademy/pre_course/blob/master/pills/control_flow.md)) to only print the list if there is at least one student in there?

[Next: Adding an interactive menu](09_adding_interactive_menu.md)
