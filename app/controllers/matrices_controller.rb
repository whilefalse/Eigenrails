require "matrix"
class MatricesController < ApplicationController

  def index
    @dimension = if params[:dimension] then params[:dimension].to_i elsif params[:matrix] then params[:matrix].length else 2 end
    @allowed_dimensions = 2..3
    @matrix = Matrix[*params[:matrix].values.map {|row| row.values.map {|elem| elem.to_f}}] if params[:matrix]
  end

end
