class ProficienciesController < ApplicationController
  def edit
    @talent = Talent.find(params[:talent_id])
    @proficiencies = @talent.profile.proficiencies
  end
end
