module MatrixHelper
  CHART_URL = "https://chart.googleapis.com/chart?cht=tx&chl="

  def matrix_latex matrix
    tex = '\begin{bmatrix}' + matrix.to_a.map {|row| row.join(' & ')}.join(' \\\\') + '\end{bmatrix}'
    image_tag tex_url(tex), :alt => 'Matrix Preview'
  end

  def tex_url tex
    CHART_URL + u(tex)
  end
end
