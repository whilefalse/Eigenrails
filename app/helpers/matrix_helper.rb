require "matrix"
module MatrixHelper
  CHART_URL = "https://chart.googleapis.com/chart?cht=tx&chl="

  Matrix.class_eval do
    def to_tex type='b'
      '\begin{'+type+'matrix}' + to_a.map {|row| row.join(' & ')}.join(' \\\\') + '\end{'+type+'matrix}'
    end
  end

  def tex_image tex, alt='Matrix Preview'
    image_tag chart_url(tex), :alt => alt
  end

  def chart_url tex
    CHART_URL + u(tex)
  end
end
