class UsersController < ApplicationController

  def free_agent_true
    @user = current_user
    if @user.update(set_free_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path }
      end
    end
  end

  def free_agent_false
    @user = current_user
    if @user.update(set_free_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path }
      end
    end
  end

  private

  def set_free_params
    params.require(:user).permit(:free_agent)
  end
end
