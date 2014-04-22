class CompaniesController < ApplicationController

  def create
    linkedin_client = authorize_with_linkedin
    redirect_to new_company(linkedin_client)
  end

  def show
    @company = Company.find(params[:id])
    @profile = @company.profile
  end

  private

  def new_company(client)
    handler = CompanySignupHandler.new client
    handler.process
  end
end
