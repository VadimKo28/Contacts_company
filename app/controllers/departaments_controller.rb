class DepartamentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @departaments = Departament.all
  end

  def show
    departament = Departament.find(params[:id])
    @contacts = departament.contacts 
  end
end
