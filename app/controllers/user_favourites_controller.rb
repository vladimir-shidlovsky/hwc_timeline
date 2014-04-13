class UserFavouritesController < ApplicationController
  def create
    current_user.add_tags(pertmitted_params[:tag_ids])
    unless current_user.save
      flash[:alert] = current_user.errors.full_messages.join("\n")
    end
    redirect_to :back, status: 303
  end

  def delete
    current_user.remove_tags(pertmitted_params[:tag_ids])
    unless current_user.save
      flash[:alert] = current_user.errors.full_messages.join("\n")
    end
    redirect_to :back, status: 303
  end

  private

  def pertmitted_params
    params[:tag_ids] &&= params[:tag_ids].split('/')

    params.permit([tag_ids: []])
    params
  end
end
