class PlatosController < ApplicationController
  def index
    @platos = Plato.all
  end
end
