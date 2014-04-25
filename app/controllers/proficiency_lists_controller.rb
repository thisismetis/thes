class ProficiencyListsController < ApplicationController
  before_action :not_found, unless: :talent?
  respond_to :html

  def edit
    @talent = current_user
    @proficiencies = @talent.profile.proficiencies
  end

  def update
    current_user.update(proficiencies_params)
    respond_with talent
  end

  private

  def find_talent
    Talent.find(params[:talent_id])
  end

  def proficiencies_params
    params.require(:talent).permit(
      profile_attributes: [
        :id,
        proficiencies_attributes: [:id, :level]
      ]
    )
  end
end
