class UsersController < ApplicationController
  def update
    @user = current_user
    if @user.update(set_free_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to events_path, notice: 'Votre statut a été mis à jour.' }
      end
    end
  end

  private

  def set_free_params
    params.require(:user).permit(:free_agent)
  end
end
