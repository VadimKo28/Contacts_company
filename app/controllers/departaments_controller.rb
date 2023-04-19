class DepartamentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @departaments = Departament.all
  end
end
