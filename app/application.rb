class Application

 @@items = ["Apples","Carrots","Pears"]
  
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
    #  class Application

    if req.path.match(/items/)
        requested_item = req.path.split("/items/").last 
        item = @@items.find{|i| i.name == requested_item} #does this connect with item class as localhost does not recognise?

        if item
            resp.write item.price
        else 
            resp.write "Item not found"
            resp.status = 400
        end
      
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
    end
  end