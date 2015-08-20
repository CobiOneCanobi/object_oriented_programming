class Person
  attr_accessor :name

  def greeting
    puts "Hi, my name is #{name}"
  end
end


class Student < Person
  def learn
    puts "I get it"
  end
end


class Instructor < Person
  def teach
   puts "Everything in Ruby is an Object"
  end
end

instructor = Instructor.new
instructor.name = "Chris"
instructor.greeting
instructor.teach

student = Student.new
student.name = "Cristina"
student.greeting
student.learn
#student.teach doesn't work since
#there is no teach method in the student class or in it's parent class Person

