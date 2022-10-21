class UsersController < ApplicationController

  def index
    matching_users = User.all

    @list_of_users = matching_users.order(:created_at) 

    render({ :template => "user_templates/index.html.erb"})
  end
  
  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    render({ :template => "user_templates/show.html.erb"})
  end
  
  def create
    input_username = params.fetch("query_username")
    a_new_username = User.new
    a_new_username.username = input_username
    a_new_username.save

    next_url = "/users/" + a_new_username.username
    redirect_to("/users/" + a_new_username.username)
  end
  
  def update
    the_username = params.fetch("modify_username")
    matching_usernames = User.where({ :username => the_username })
    the_username = matching_usernames.at(0)

    input_username = params.fetch("query_username2")

    the_username.username = input_username
    the_username.save

    #render({ :template => "user_templates/update.html.erb" })

    next_url = "/users/" + the_username.username
    redirect_to(next_url)
  end

end
