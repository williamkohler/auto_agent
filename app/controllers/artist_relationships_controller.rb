class ArtistRelationshipsController < ApplicationController

  def create
    @relationship = ArtistRelationship.new(artist_id: params[:artist_id],
                                           user_id: params[:user_id])
    # @relationship = ArtistRelationship.new(artist_relationship_params)
    @artist = Artist.find(params[:artist_id])
    @user = User.find(params[:user_id])

    if @relationship.save
        flash[:success] = "#{@artist.name} assigned to #{@user.name}"
      else
        flash[:danger] = "Relationship already exists"
      end
      redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id])
    @artist = Artist.find_by(params[:artist_id])
    ArtistRelationship.find_by(artist_id: params[:artist_id],
                               user_id: params[:user_id]).destroy
    # flash[:success] = "Relationship removed"
    flash[:success] = "#{params[:artist_id]} removed from #{@user.name}"
    redirect_to @user
  end


  #TODO find out how to pass this with strong params
  def artist_relationship_params
    params.require(:artist_relationship).permit(:artist_id, :user_id )
  end

  private

end
