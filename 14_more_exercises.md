# 14. More Exercises

[Back to README](README.md)

Like in the previous exercises, off you find yourself struggling, discuss the exercise with other students, pair on it or just do an easy one before coming back to the harder exercise.

1. After we added the code to load the students from file, we ended up with adding the students to `@students` in two places. The lines in `load_students()` and `input_students()` are almost the same. This violates the *DRY (Don't Repeat Yourself)* principle. How can you extract them into a method to fix this problem?

2. How could you make the program load `students.csv` by default if no file is given on startup? Which methods would you need to change?

3. Continue refactoring the code. Which method is a bit too long? What method names are not clear enough? Anything else you'd change to make your code look more elegant? Why?

4. Right now, when the user choses an option from our menu, there's no way of them knowing if the action was successful. Can you fix this and implement feedback messages for the user?

5.	The filename we use to save and load data (menu items 3 and 4) is hardcoded. Make the script more flexible by asking for the filename if the user chooses these menu items.

6.	We are opening and closing the files manually. Read the documentation of the `File` class to find out how to use a code block (`do...end`) to access a file, so that we don't have to close it explicitly (it will be closed automatically when the block finishes). Refactor the code to use a code block.

7.	We are de-facto using CSV format to store data. However, Ruby includes [a library to work with the CSV files](http://www.ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html) that we could use instead of working directly with the files. Refactor the code to use this library.

8. Write a short program that reads its own source code (search StackOverflow to find out how to get the name of the currently executed file) and prints it on the screen.
