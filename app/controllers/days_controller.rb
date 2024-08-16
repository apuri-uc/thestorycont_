class DaysController < ApplicationController
  def index
    matching_days = Day.all

    @list_of_days = matching_days.order({ :created_at => :asc })

    @date = Date.today
    @id = Date.today
    @start_of_week = @date.beginning_of_week(:sunday)
    @end_of_week = @start_of_week + 6.days

    render({ :template => "days/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_days = Day.where({ :id => the_id })

    @the_day = matching_days.at(0)

    render({ :template => "days/show" })
  end

  def create
    the_day = Day.new
    the_day.entries = params.fetch("query_entries")
    the_day.g1_workedon = params.fetch("query_g1_workedon")
    the_day.g2_workedon = params.fetch("query_g2_workedon")
    the_day.g3_workedon = params.fetch("query_g3_workedon")

    if the_day.valid?
      the_day.save
      redirect_to("/this_week", { :notice => "Day created successfully." })
    else
      redirect_to("/this_week", { :alert => the_day.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_day = Day.where({ :id => the_id }).at(0)

    the_day.entries = params.fetch("query_entries")
    the_day.g1_workedon = params.fetch("query_g1_workedon")
    the_day.g2_workedon = params.fetch("query_g2_workedon")
    the_day.g3_workedon = params.fetch("query_g3_workedon")
    the_day.g1 = params.fetch("query_g1")
    the_day.g2 = params.fetch("query_g2")
    the_day.g3 = params.fetch("query_g3")

    if the_day.valid?
      the_day.save
      redirect_to("/days/#{the_day.id}", { :notice => "Day updated successfully."} )
    else
      redirect_to("/days/#{the_day.id}", { :alert => the_day.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_day = Day.where({ :id => the_id }).at(0)

    the_day.destroy

    redirect_to("/days", { :notice => "Day deleted successfully."} )
  end
end
