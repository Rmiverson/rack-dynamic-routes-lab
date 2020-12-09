class Application

   @@item = []

   def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match("/items/")
         s_item = req.path.split("/").last
         a_item = Item.all.find{|item| item.name == s_item}
         if a_item
            resp.write a_item.price
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