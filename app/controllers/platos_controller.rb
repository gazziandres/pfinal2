class PlatosController < ApplicationController
  def index
    @platos = Plato.all
  end

  def landing
  end
end
