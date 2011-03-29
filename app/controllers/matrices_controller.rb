require "matrix"
class MatricesController < ApplicationController

  def index
    @dimension = if params[:dimension] then params[:dimension].to_i elsif params[:matrix] then params[:matrix].length else 4 end
    @matrix = Matrix[*params[:matrix].values.map {|row| row.values.map {|elem| elem.to_i}}] if params[:matrix]
  end

end
