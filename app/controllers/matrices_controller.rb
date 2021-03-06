class MatricesController < ApplicationController

  def index
    @allowed_dimensions = [2]
    @dimension = if params[:dimension] then params[:dimension].to_i elsif params[:matrix] then params[:matrix].length else 2 end
    @matrix = TexMatrix[*params[:matrix].values.map {|row| row.values.map(&:to_i)}] if params[:matrix]
  end

end
