class AgentsController < ApplicationController
  before_action :admin_user,      only: [:create, :index, :destroy]

  def create
    @agent = Agent.new(agent_params)
    if @agent.save
      flash[:success] = "Created #{params[:agent][:name]}."
    else
      if Agent.exists?(name: params[:agent][:name])
        flash[:danger] = "#{params[:agent][:name]} already exists"
      elsif Agent.exists?(hubspot_id: params[:agent][:hubspot_id])
        flash[:danger] = "Hubspot id #{params[:agent][:hubspot_id]}
                          already exists"
      else
        flash[:danger] = "Unable to create agent"
      end
    end
    redirect_to agents_path
  end

  def index
    @agent = Agent.new
    @agents = Agent.all.paginate(page: params[:page])
  end

  def destroy
    agent = Agent.find(params[:id])
    flash[:warning] = "#{agent.name} removed"
    agent.destroy
    redirect_to agents_path
  end

  private
  def agent_params
    params.require(:agent).permit(:name, :hubspot_id)
  end

  # Before filters

  private

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
