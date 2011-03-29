require "matrix"
class MatricesController < ApplicationController

  def index
    @dimension = [params[:dimension], params[:matrix], 4].select {|x| x}.first.to_i
    @matrix = Matrix[*params[:matrix].values.map {|row| row.values.map {|elem| elem.to_i}}] if params[:matrix]
  end

end
