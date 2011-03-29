require "matrix"
class MatricesController < ApplicationController

  def index
    @dimension = params[:size].to_i or 4
    @matrix = Matrix[*params[:matrix].values.map {|row| row.values.map {|elem| elem.to_i}}] if params[:matrix]
  end

end
