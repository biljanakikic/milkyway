require 'rubygems'
require 'json'
require 'net/http'

class CoursesController < ApplicationController

 before_action :authenticate_admin!
 before_filter :index
 #respond_to :json
 
 def new
  
 end
  
 def index

# uri = URI.parse('https://api.audiolumin.com/alpha/mw/courses')
# http = Net::HTTP.new(uri.host, uri.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE
# request = Net::HTTP::Get.new(uri.path,
#                              'Content-Type'  => 'application/json',
#                              'apik' => "3RqZPzuT7o2FRfnQxIhmqOAbFZBv67a8EXVMktOpEkguVBcaCloAQvLtz4fYpJ4")
#  response = http.request(request) 
#  data =response.body
#  @courses = JSON.parse(data)
     
   response = HTTP
      .headers("Content-Type" => "application/json", "apik" => "3RqZPzuT7o2FRfnQxIhmqOAbFZBv67a8EXVMktOpEkguVBcaCloAQvLtz4fYpJ4")
      .get("https://api.audiolumin.com/alpha/mw/courses")
    @courses = JSON.parse(response.body)

 #render :text => @courses
end

def edit

end

def update
  num=0
   cnum=Integer(params["num#{num}"])
   title=params["title"]
   @courses[cnum]['title']=title
  render :text => @courses

end

def update_lessons

    num=Integer(params["num"])
  @courses[num]['lessons'].each do |lesson|
   lnum+=1
  # l_num=Integer(params["num{#lnum-1}"])
   l_title=params["ltitle{#lnum-1}"]
   @courses[num]['lessons'][lnum]['title']=l_title

    render :text => @courses[num]['lessons']

    end

end

    


end
