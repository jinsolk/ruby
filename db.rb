require 'sqlite3'

class DBHandler
def initialize
begin
db = SQLite3::Database.new "course.db"
dbstatement = "CREATE TABLE IF NOT EXISTS Courses(ID INTEGER PRIMARY KEY, CourseName TEXT, CourseCredit Integer, CourseGrade Integer)"
db.execute dbstatement
rescue SQLite3::Exception => e 
puts "Exception Occurred" 
puts e
ensure
db.close if db
end 
end

def create(name,credit,grade) 
begin
db = SQLite3::Database.open "course.db"
dbstatement = "INSERT INTO Courses(CourseName,CourseCredit,CourseGrade) VALUES ('#{name}','#{credit}','#{grade}')"
db.execute dbstatement
rescue SQLite3::Exception => e 
puts "Exception Occurred" 
puts e
ensure
db.close if db
end 
end



def all
begin
db = SQLite3::Database.open "course.db"
dbstatement = "Select * from Courses"
db.execute dbstatement
rescue SQLite3::Exception => e 
puts "Exception Occurred" 
puts e
ensure
db.close if db
end 
end

def count
begin
db = SQLite3::Database.open "course.db"
dbstatement = "Select count(*) from Courses;"
db.execute dbstatement
rescue SQLite3::Exception => e 
puts "Exception Occurred" 
puts e
ensure
db.close if db
end 
end

def update(id, name, credit, grade)
begin
db = SQLite3::Database.open "course.db"
dbstatement = "UPDATE Courses SET CourseName='#{name}', CourseCredit='#{credit}', CourseGrade='#{grade}' WHERE ID='#{id}'"
db.execute dbstatement
rescue SQLite3::Exception => e
puts "Exception Occurred"
puts e
ensure
db.close if db
end
end



def destroy(id)
begin
db = SQLite3::Database.open "course.db"
dbstatement = "DELETE FROM Courses WHERE ID='#{id}'"
db.execute dbstatement
rescue SQLite3::Exception => e
puts "Exception Occurred"
puts e
ensure
db.close if db
end
end

def get(id)
begin
db = SQLite3::Database.open "course.db"
dbstatement = "SELECT * FROM  Courses WHERE ID=' #{id}'"
db.execute dbstatement
rescue SQLite3::Exception => e
puts "Exception Occurred"
puts e
ensure
db.close if db
end
end

end

