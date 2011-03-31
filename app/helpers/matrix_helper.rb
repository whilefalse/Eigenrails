require "matrix"
module MatrixHelper
  CHART_URL = "https://chart.googleapis.com/chart?cht=tx&chl="
  WOLFRAM_URL = "http://www.wolframalpha.com/input/?i="

  def tex_image tex, alt='Matrix Preview'
    image_tag chart_url(tex), :alt => alt
  end

  def chart_url tex
    CHART_URL + u(tex)
  end

  def wolfram_url matrix
    WOLFRAM_URL + u('{{' + matrix.to_a.map {|row| row.join(',')}.join('},{') + '}}')
  end

  def matrix_tex matrix, type='b'
    '\begin{' + type + 'matrix}' + matrix.to_a.map {|row| row.join(' & ')}.join(' \\\\') + '\end{' + type + 'matrix}'
  end

  def char_eq_tex matrix
    a, b, c = 1, -matrix.trace, matrix.determinant
    case matrix.row_size
    when 2 then
      "\\begin{align}"+
        "(#{matrix[0,0]} - \\lambda)(#{matrix[1,1]} - \\lambda) - (#{matrix[0,1]})(#{matrix[1,0]}) &= 0\\\\"+
        "\\lambda ^2 #{with_sign b}\\lambda #{with_sign c} &= 0"+
        "\\end{align}"
    else raise "Size too big to calculate eigenvalues"
    end
  end

  def eigen_values matrix
    a, b, c = 1, -matrix.trace, matrix.determinant
    rhs = Math.sqrt(b**2 - 4*a*c)
    [(-b + rhs)/2*a, (-b - rhs) / 2*a]
  end

  def eigen_values_tex matrix
    e1, e2 = eigen_values(matrix)
    "\\lambda_1 = #{e1.round 3}\\\\ \\lambda_2 = #{e2.round 3}"
  end

  def with_sign x
    (x >= 0 ? "+#{x}" : x).to_s
  end
end
