module MatrixHelper
  CHART_URL = "https://chart.googleapis.com/chart?cht=tx&chl="

  def tex_for_matrix matrix, type='b'
    '\begin{'+type+'matrix}' + matrix.to_a.map {|row| row.join(' & ')}.join(' \\\\') + '\end{'+type+'matrix}'
  end

  def tex_image tex, alt='Matrix Preview'
    image_tag chart_url(tex), :alt => alt
  end

  def chart_url tex
    CHART_URL + u(tex)
  end
end
