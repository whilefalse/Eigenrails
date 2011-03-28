module MatrixHelper
  @@chart_url = "https://chart.googleapis.com/chart?cht=tx&chl="

  def matrix_latex matrix
    tex = '\begin{bmatrix}' + matrix.to_a.map {|row| row.join(' & ')}.join(' \\\\') + '\end{bmatrix}'
    image_tag(@@chart_url + u(tex))
  end

end
