require "matrix"
Numeric.class_eval do
  def with_sign
    (self >= 0 ? "+#{self}" : self).to_s
  end
end

Matrix.class_eval do
  def to_tex type='b'
    '\begin{'+type+'matrix}' + to_a.map {|row| row.join(' & ')}.join(' \\\\') + '\end{'+type+'matrix}'
  end

  def eigen_values
    a, b, c = 1, -trace, determinant
    rhs = Math.sqrt(b**2 - 4*a*c)
    [(-b + rhs)/2*a, (-b - rhs) / 2*a]
  end

  def eigen_values_tex
    e1, e2 = eigen_values
    "\\lambda_1 = #{e1.round 3}\\\\ \\lambda_2 = #{e2.round 3}"
  end

  def char_eq_tex
    a, b, c = 1, -trace, determinant
    case row_size
    when 2 then
      "\\begin{align}"+
        "(#{self[0,0]} - \\lambda)(#{self[1,1]} - \\lambda) - (#{self[0,1]})(#{self[1,0]}) &= 0\\\\"+
        "\\lambda ^2 #{b.with_sign}\\lambda #{c.with_sign} &= 0"+
        "\\end{align}"
    else raise "Size too big to calculate eigenvalues"
    end
  end

  def to_wolfram
    '{{' + to_a.map {|row| row.join(',')}.join('},{') + '}}'
  end
end

module MatrixHelper
  CHART_URL = "https://chart.googleapis.com/chart?cht=tx&chl="
  WOLFRAM_URL = "http://www.wolframalpha.com/input/?i="

  def tex_image tex, alt='Matrix Preview'
    image_tag chart_url(tex), :alt => alt
  end

  def chart_url tex
    CHART_URL + u(tex)
  end

  def wolfram_url code
    WOLFRAM_URL + u(code)
  end
end
