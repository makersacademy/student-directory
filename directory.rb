
require 'csv' 

# an instance variable for the students array, accessible to all methods
@students = []
@filename = ""
@search = ""
@length_name = ""
@months = {January: 1, February: 2, March: 3, April: 4, May: 5, June: 6, July: 7, August: 8, September: 9, October: 10, November: 11, December: 12}

# interactive menu
def interactive_menu
    try_load_students
    loop do
        print_menu
        process(STDIN.gets.strip) #get the selection and take the relevant action
   end # end loop
end # interactiv_menu

def print_menu
    #print the menu and ask the user what to do
    message "Please enter a number to select an option:"
    puts "1. Enter students"
    puts "2. Show the students"
    puts "3. Save a list to .csv file"
    puts "4. Load a list from .csv file"
    puts "5. Delete a student from the list"
    puts "6. Clear the list of students"
    puts "8. Print source code of directory.rb"
    puts "9. Exit"
end

# processes the input
def process(selection)
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "3"
            save_students
        when "4"
            select_file_to_load
        when "5"
            delete_student
        when "6"
            clear_list
        when "8"
            print_source_code
        when "9"
            exit # causes program to end
        else puts "I don't know what you mean, please try again."
    end # end case
end # process

def message (m)
    return if m.nil? 
    puts "--------------------------------------------------"
    puts m
    puts "--------------------------------------------------"
end

#gets a input from the use and returns an array of the students entered
def input_students
    puts "Please enter students."
    puts "To finish, press return twice"
    
    puts "Please enter student first name:"
    firstname = STDIN.gets.strip 

    #keep looping while there is data inputted
    while !firstname.empty? do
        firstname.capitalize!
        puts "Please enter student last name:"
        lastname = STDIN.gets.strip
        lastname.capitalize!
        lastname = "NONE" if lastname.empty?
        month = get_month
        year = get_year
        enter_student(firstname, lastname, month.to_sym, year.to_sym)
        (@students.count == 1) ? (puts "Now we have 1 student") : (puts "Now we have #{@students.count} students")
        puts "Please enter a new student's firstname:"
		puts "(Press 'enter' to return to main menu)"
		firstname = STDIN.gets.strip 
    end
    @students.sort_by!{|x| x[:firstname]}
end # input_students

def get_month
    puts "Please the month of the cohort (January to December)"
    puts "Press enter to input current month"
    month = STDIN.gets.strip
    if month.empty?
       Time.now.strftime("%B") 
    elsif @months.keys.include?(month.to_sym)
        return month
    else
        puts "The month of the month is invalid. Please enter a month from January to December."
        get_month
    end
end

def get_year
    puts "Please enter year of month from 2000 onwards"
    puts "Press enter to input current year"
    year = STDIN.gets.strip
    if year.empty?
        return Time.now.strftime("%Y") 
    elsif ((year.length == 4) && (year.to_i > 2000))
        return year
    else    
        puts "Please enter a valid year from 2000 (eg 2017)."
        get_year
    end
end

def enter_student(firstname, lastname, month, year)
    @students << {firstname: firstname, lastname: lastname, month: month.to_sym, year: year.to_sym}
end

def show_students 
    (print_no_students_enrolled; return) if @students.empty?
    message "Enter 0 to show entire list in first name order
    Enter 1 to search by name 
    Enter 2 to search by name length
    Enter 3 to show list by cohort"
    selection = STDIN.gets.strip
    until (selection.to_i >=0 && selection.to_i <=3) 
        puts "Enter 0 to show entire list in first name order
    Enter 1 to search by name 
    Enter 2 to search by name length
    Enter 3 to show list by cohort"
        selection = STDIN.gets.strip
    end
    case selection
    when "0"
        print_student_list
    when "1"
        search_students_by_name_start
    when "2"
        search_students_by_name_length
    when "3"
        print_students_by_cohort
    end
end # show_students

#print each student by month
def print_student_list
    print_header
    @students.each_with_index do |student, index|
        puts "#{index+1}. #{student[:firstname]} #{student[:lastname]} (#{student[:month]} #{student[:year]} cohort)".center(25)
    end
    print_footer
end # print_student_list

def print_no_students_enrolled
    message "There are no student enrolled in Villains Academy."
end

def print_header
    message "The students of Villains Academy"
end # print_header

# finally, we print the total number of students
def print_footer 
    puts "Overall, we have #{ @students.count } great student" 
    print "s" if @students.count != 1
end # print_footer

def search_students_by_name_start
    while @search == ""
        message "Please enter the start of name to search for students:"
        @search = STDIN.gets.strip
    end
    message "Searching for students starting with \"#{@search}\""
    @students.each_with_index do |student, index|
        puts "#{index+1}. #{student[:firstname]} #{student[:lastname]} (#{student[:month]} #{student[:year]} cohort)".center(25) if student[:firstname].start_with?(@search)
    end
    @search=""
end

def search_students_by_name_length
    while @length_name == ""
        message "Please enter a length of first name between 1 and 30 to search for students:"
        temp = STDIN.gets.strip
        @length_name = temp if (temp.to_i > 0) && (temp.to_i <=30)
    end
    message "Searching for students with name less than max length of \"#{@length_name}\""
    @students.each_with_index do |student, index|
        puts "#{index+1}. #{student[:firstname]} #{student[:lastname]} (#{student[:month]} #{student[:year]} cohort)".center(25) if student[:firstname].length <= @length_name.to_i
    end
    @length_name = ""
end

def print_students_by_cohort
    puts "Listing students by cohort:"
    temp = @students.group_by{ |x| x[:year] }#.each.sort_by { |x| @months[x[:month]] } #sort into month order
    if temp.length == 1
        @students = temp.values.flatten.sort_by { |x| @months[x[:month]] }.reverse #sort into month order
        print_student_list
    else 
        @students = []
        temp.each do |year_group|
            @students << year_group[1].sort_by { |x| @months[x[:month]] }.reverse
        end
        @students.flatten!
        print_student_list
    end
end

def save_students
    message("Select filename to save list in.")
    select_file_name
    CSV.open(@filename, "w") do |csv|
        @students.each do |student|
            csv << [student[:firstname],student[:lastname],student[:month],student[:year]]
        end
    end
    message "List of students saved to #{@filename}"
end #save_students

def select_file_to_load
    message("Select filename to load...")
    select_file_name
    load_students
end

def try_load_students
    #first arguemnt on the command line, or try students.csv
    @filename = ARGV.first
    if !@filename.nil? 
        if File.exists?(@filename)
            load_students
            return
        end
        message "Sorry, #{@filename} doesn't exist."
    end
    if File.exists?("students.csv")
        message "Loading from default file students.csv"
        @filename = "students.csv"
        load_students
    end
end

def select_file_name
   loop do
        puts "Default filename is students.csv. Do you want to enter a different file name? (Enter yes or no)"
        option = STDIN.gets.strip
        case option
        when "no"
            @filename = "students.csv"
            break
        when "yes"
            @filename = STDIN.gets.strip
            break if @filename != ""
        else
        end
    end # end loop 
end

def load_students 
    if File.exists?(@filename)
        CSV.foreach(@filename) do |row|
            firstname, lastname, month, year = row
            (message "File data needs to be in format if FIRSTNAME, LASTNAME, MONTH, YEAR"; @students = []; return) if row.length != 4
            enter_student(firstname, lastname, month, year)
        end
        @students.sort_by!{|x| x[:firstname]}
        message "Loaded #{@students.count} students from #{@filename}."
    else
        message "Sorry, #{@filename} doesn't exist."
    end
end #load_students

def delete_student 
    (print_no_students_enrolled; return) if @students.empty?
    
    message "Please enter the firstname of a student to delete from the list:"
    firstname = STDIN.gets.strip
    (message "No valid name entered."; return) if firstname.empty? 
    puts "Please enter the last name of the student to delete:"
    lastname = STDIN.gets.strip
    lastname = "NONE" if lastname.empty?
    @students.each_with_index do |student,i| 
        if student[:firstname] == firstname && student[:lastname] == lastname
            @students.delete_at(i) 
            message "\"#{student[:firstname]} #{student[:lastname]} (#{student[:month]} #{student[:year]} cohort)\" now deleted from list of students" 
            return
        end
    end
    message "#{student[:firstname]} #{student[:lastname]} not found in list of students"
end

def clear_list
   @students = []
   message "The list of students has been cleared"
end

def print_source_code
    message "Source code for directory.rb:" 
    puts File.open(__FILE__, "r").read
end

#run the program!
interactive_menu
