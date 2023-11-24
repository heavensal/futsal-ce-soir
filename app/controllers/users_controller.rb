class UsersController < ApplicationController

  def free_agent_true
    @user = current_user
    if @user.update(set_free_params)
      redirect_to root_path
    end
  end

  def free_agent_false
    @user = current_user
    if @user.update(set_free_params)
      redirect_to root_path
    end
  end

  private

  def set_free_params
    params.require(:user).permit(:free_agent)
  end
end
