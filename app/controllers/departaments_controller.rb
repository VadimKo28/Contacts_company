class DepartamentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @departaments = Departament.all
  end

  def departament_search
    @departament = Departament.find(params[:search])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Вы не ввели значение"
    redirect_to root_url
  end
end
