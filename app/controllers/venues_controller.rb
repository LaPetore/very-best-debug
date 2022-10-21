class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @list_of_venues = matching_venues.order({ :created_at => :desc })

    render({ :template => "venue_templates/index.html.erb" })
  end

  def show
    url_id = params.fetch("an_id")

    matching_venues = Venue.where({ :id => url_id })

    @the_venue = matching_venues.first

    render({ :template => "venue_templates/show.html.erb" })
  end

  def create
    input_address = params.fetch("query_address")
    input_name = params.fetch("query_name")
    input_neighborhood = params.fetch("query_neighborhood")

    a_new_venue = Venue.new

    a_new_venue.address = input_address
    a_new_venue.name = input_name
    a_new_venue.neighborhood = input_neighborhood 

    a_new_venue.save

    #render({ :template => "venue_templates/create.html.erb" })
    
    redirect_to("/venues/" + a_new_venue.id.to_s)
  end
  
  def update
    the_id = params.fetch("modify_id")
    matching_venues = Venue.where({ :id => the_id })
    the_venue = matching_venues.at(0)

    input_address = params.fetch("query_address2")
    input_name = params.fetch("query_name2")
    input_neighborhood = params.fetch("query_neighborhood2")

    the_venue.address = input_address
    the_venue.name = input_name
    the_venue.neighborhood = input_neighborhood

    the_venue.save

    #render({ :template => "venue_templates/update.html.erb"})

    next_url = "/venues/" + the_venue.id.to_s
    redirect_to(next_url)
  end

  def byebye
    the_id = params.fetch("toast_id")
    matching_venues = Venue.where({ :id => the_id })
    the_venue = matching_venues.at(0)
    the_venue.destroy

    redirect_to("/venues")
  end

end
