require 'rubygems'
require 'json'
require 'net/http'

class CoursesController < ApplicationController
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
	respond_to :json
    $coursesURI = "https://api.audiolumin.com/alpha/courses/frontPage"


 def getCourses
    response = Net::HTTP.get_response(URI.parse($coursesURI))
    data = response.body
    JSON.parse(data)
 
    #render :text => JSON.parse(data)
    $courses=JSON.parse(data)

    courses=JSON.parse(data)
#render :text => courses[1]['title']

 def format_courses(courses)
 courses.map do |course| # change each -> map
    "#{ course['title'] }<br>" # delete puts, [0]
  end.join  #change to_sentence -> join
   
end


  render :text =>format_courses(courses)
 

    #  i = 0
    #  for i in $courses
    # puts $courses[i]['title']
    #   #course=courses[i]

    #   end

  # courses.each do |course|
  #Rails.logger.info course['title']
 #puts 
# course['title']

 # end
end







# courses.each do |course|
#   courses << {
#     :id => course.id,
#     :title => course.title
#   }
# end
 


    # for i in courses do 
    # 	course = courses[i]
    	
    # end

  


 

 
end
