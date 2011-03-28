require "matrix"
class MatricesController < ApplicationController

  def index
    @dimension = 2
    @matrix = Matrix[*params[:matrix].values.map {|row| row.values.map {|elem| elem.to_i}}]
  end

end
