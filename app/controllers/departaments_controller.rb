class DepartamentsController < ApplicationController
  def index
    @departaments = Departament.all
  end
end
