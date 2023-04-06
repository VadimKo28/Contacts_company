class DepartamentsController < ApplicationController
  def index
    @departaments = Departament.all
  end

  def show
    departament = Departament.find(params[:id])
    @contacts = departament.contacts 
  end
end
