class CoursesController < ApplicationController

 before_action :authenticate_admin!
 #before_filter :index

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
     @courses = JSON.parse(response.body)
     
     id=Integer(params["id"])
     title=params["title"]
     @courses[id]['title']=title
     render  :text => @courses[id]
     response= HTTP
            .headers("Content-Type" => "application/json", "apik" => "3RqZPzuT7o2FRfnQxIhmqOAbFZBv67a8EXVMktOpEkguVBcaCloAQvLtz4fYpJ4")
            .post("https://api.audiolumin.com/alpha/mw/course/#{id}", :json => @courses[id])
     # @headers = {
     #    "apik" => "3RqZPzuT7o2FRfnQxIhmqOAbFZBv67a8EXVMktOpEkguVBcaCloAQvLtz4fYpJ4",
     #    "Content-Type" => "application/json"
     #  }
     #post("https://api.audiolumin.com/alpha/mw/course/#{id}"), @courses[id].to_json, @headers
      # @host = 'localhost'
      # @port = '3000'
      # @path = "https://api.audiolumin.com/alpha/mw/course/#{id}"
      # request = Net::HTTP::Post.new(@path, initheader = {'Content-Type' =>'application/json',"apik" => "3RqZPzuT7o2FRfnQxIhmqOAbFZBv67a8EXVMktOpEkguVBcaCloAQvLtz4fYpJ4"})
      # request.body = @courses[id].to_json
      # response = Net::HTTP.new(@host, @port).start {|http| http.request(request) }
      # rputs "Response #{response.code} #{response.message}: #{response.body}"
   end     

end
