require "matrix"
class MatricesController < ApplicationController

  def index
    @dimension = (params[:size] || 4).to_i
    @matrix = Matrix[*params[:matrix].values.map {|row| row.values.map {|elem| elem.to_i}}] if params[:matrix]
  end

end
