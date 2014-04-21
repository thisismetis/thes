class ProficienciesController < ApplicationController
  def edit
    @talent = find_talent
    @proficiencies = @talent.profile.proficiencies
  end

  def update
    talent = find_talent
    talent.update(proficiencies_params)
    redirect_to talent
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
