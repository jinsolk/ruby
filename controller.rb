require 'sinatra'
require_relative 'db.rb'

get '/' do
    redirect to '/home'
end

get '/home' do
    db = DBHandler.new
    @CourseCount = db.count
    
    erb :application do
    erb :home
    end
end

get '/add' do
    erb :application do
    erb :add
    
    end
end

post '/add' do
    db = DBHandler.new
    db.create(params[:name],params[:credit],params[:grade])
    redirect to "/home"
end

get '/courses/:id/edit' do
id = params[:id].to_i
db = DBHandler.new
@course = db.get(id)
puts "#######" 
puts @course 
erb :application do
erb :edit
end
end


post '/courses/:id' do
id = params[:id].to_i
name = params[:name]
grade = params[:grade]
credit = params[:credit]
db = DBHandler.new
db.update(id, name, credit, grade)
redirect to '/home'
end



get '/courses/:id/delete' do
id = params[:id].to_i
db = DBHandler.new
db.destroy(id)
redirect to '/home'
end

get '/courses/:id/edit' do
   
@id = params[:id].to_i

db = DBHandler.new
@course = db.get(@id)

erb :application do
    erb :edit
    end



end



get '/list' do
     db = DBHandler.new
     @courses = db.all

    erb :application do
    erb :list
    end
end

get '/calculate' do
    db = DBHandler.new
    @courses = db.all
    @CourseCount = db.count
    @gpa = 0
    @totalCredit = 0
    @totalGrade = 0

@courses.each do |id, name, credit, grade| 
        
@totalCredit = @totalCredit +  credit

case grade
when "A"
@totalGrade = @totalGrade + 4.0 * credit
when "B"
@totalGrade = @totalGrade + 3.0 * credit
when "C"
@totalGrade = @totalGrade + 2.0 * credit
when "D"
@totalGrade = @totalGrade + 1.0 * credit
when "F"
@totalGrade = @totalGrade + 0.0 * credit
end

@gpa = @totalGrade/@totalCredit

end

    erb :application do
    erb :result
    end
end



