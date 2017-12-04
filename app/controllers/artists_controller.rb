class ArtistsController < ApplicationController
  before_action :logged_in_user,  only: :index
  before_action :admin_user,      only: :destroy

  #TODO re-write as more 'the rails way'
  def index
    @user = current_user
    if @user.admin?
      @artist = Artist.new
      if params[:search]
        @artists = Artist.search(params[:search])
      else
        @artists = Artist.all
      end
    else
      @artists = @user.assigned_artists
    end
  end

  def show
    @user = current_user
    @artist = Artist.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    #TODO rewrite to be more 'the rails way'
    if @user.standard_user
      redirect_to root_url and
      flash[:danger] = "#{@user.name} not assigned to #{@artist.name}." and
      return unless
        @user.assigned_artists.include? @artist
      end
      @shows = Show.where(artist_id: @artist.id).sort_by &:start_date
      @albums = @artist.top_albums
  end

  #TODO Enforce only admins can make this change with strong params
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:success] = "Created #{params[:artist][:name]}."
    else
      flash[:danger] = "#{params[:artist][:name]} already exists"
    end
    redirect_to artists_path
  end

  def destroy
    Artist.find(params[:id]).destroy
    flash[:info] = "Artist deleted"
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

    # Before filters

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
