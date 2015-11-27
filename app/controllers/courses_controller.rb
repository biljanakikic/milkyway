class CoursesController < ApplicationController

 before_action :authenticate_admin!
 respond_to :html, :json
 # before_filter :index

  def new
    
  end
    
  def index
     response = HTTP
        .headers("Content-Type" => "application/json", "apik" => "3RqZPzuT7o2FRfnQxIhmqOAbFZBv67a8EXVMktOpEkguVBcaCloAQvLtz4fYpJ4")
        .get("https://api.audiolumin.com/alpha/mw/courses")
     @courses = JSON.parse(response.body)


  end

  def edit
     response = HTTP
        .headers("Content-Type" => "application/json", "apik" => "3RqZPzuT7o2FRfnQxIhmqOAbFZBv67a8EXVMktOpEkguVBcaCloAQvLtz4fYpJ4")
        .get("https://api.audiolumin.com/alpha/mw/courses")
     @courses = JSON.parse(response.body)
  end

  def update
     response = HTTP
        .headers("Content-Type" => "application/json", "apik" => "3RqZPzuT7o2FRfnQxIhmqOAbFZBv67a8EXVMktOpEkguVBcaCloAQvLtz4fYpJ4")
        .get("https://api.audiolumin.com/alpha/mw/courses")
     @courses =JSON.parse(response.body)
     i=Integer(params["i"])
     id=@courses[i]['id']
     params.each do|key, value|
        @courses[i][key]=value
        # if value=='' 
        #  redirect_to (edit_course_path(i))
        # end
     end
    #render :json =>@courses[i]
    request = HTTP
      .headers("Content-Type" => "application/json", "apik" => "3RqZPzuT7o2FRfnQxIhmqOAbFZBv67a8EXVMktOpEkguVBcaCloAQvLtz4fYpJ4", "Accept" => "application/json")
      .post("https://api.audiolumin.com/alpha/mw/courses/#{id}", :json => @courses[i])
    redirect_to (root_url) 
   end     

end
