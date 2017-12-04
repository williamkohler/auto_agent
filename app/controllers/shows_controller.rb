class ShowsController < ApplicationController

  def new
    @show = Show.new
  end

  def index
    @shows = current_user.assigned_shows
  end

def create
  artist = Artist.find_by(name: params[:show][:artist])
  if artist.nil?
    flash[:info] = "#{params[:show][:artist]} not found"
    redirect_to new_show_path
  else
    @show = Show.new(show_params)
    if @show.save
      flash[:success] = "Saved show for
                        #{artist.name}"
      redirect_to new_show_path
    else
      flash[:warning] = 'Unable to create show'
      redirect_to new_show_path
    end
  end
  end

def import
  if params[:show].nil?
    flash[:warning] = "No shows have been uploaded"
    redirect_to shows_path
  elsif import_params
    @show_report = Show.import params[:show][:csv_file]
  else
    redirect_to root_url
  end
end

  private

    def show_params
      params.require(:show).permit(:deal_id, :artist, :start_date)
    end

    def import_params
      params.require(:show).permit(:csv_file)
    end

end
