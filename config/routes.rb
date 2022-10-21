Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/insert_user_record", { :controller => "users", :action => "create" })
  get("/update_username/:modify_username", { :controller => "users", :action => "update" })

  get("/venues", { :controller => "venues", :action => "index" })
  get("/venues/:an_id", { :controller => "venues", :action => "show" })
  get("/insert_venue_record", { :controller => "venues", :action => "create" })
  get("/update_venue/:modify_id", { :controller => "venues", :action => "update" })
  get("/delete_venue/:toast_id", { :controller => "venues", :action => "byebye" })
  
  get("/insert_comment_record", { :controller => "comments", :action => "create" })
 
end
