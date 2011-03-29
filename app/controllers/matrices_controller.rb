require "matrix"
class MatricesController < ApplicationController

  helper MyHelper

  def index
    @dimension = 2
    @matrix = Matrix[*params[:matrix].values.map {|row| row.values.map {|elem| elem.to_i}}] if params[:matrix]
  end

end
