class EntriesController < ApplicationController
  def index
    matching_entries = Entry.all

    @list_of_entries = matching_entries.order({ :created_at => :desc })

    render({ :template => "entries/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_entries = Entry.where({ :id => the_id })

    @the_entry = matching_entries.at(0)

    render({ :template => "entries/show" })
  end

  def create
    the_entry = Entry.new
    the_entry.day_id = params.fetch("query_day_id")
    the_entry.user_id = params.fetch("query_user_id")
    the_entry.daily_entry = params.fetch("query_daily_entry")

    if the_entry.valid?
      the_entry.save
      redirect_to("/entries", { :notice => "Entry created successfully." })
    else
      redirect_to("/entries", { :alert => the_entry.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_entry = Entry.where({ :id => the_id }).at(0)

    the_entry.day_id = params.fetch("query_day_id")
    the_entry.user_id = params.fetch("query_user_id")
    the_entry.daily_entry = params.fetch("query_daily_entry")

    if the_entry.valid?
      the_entry.save
      redirect_to("/entries/#{the_entry.id}", { :notice => "Entry updated successfully."} )
    else
      redirect_to("/entries/#{the_entry.id}", { :alert => the_entry.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_entry = Entry.where({ :id => the_id }).at(0)

    the_entry.destroy

    redirect_to("/entries", { :notice => "Entry deleted successfully."} )
  end
end
