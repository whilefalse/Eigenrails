require "matrix"
require "complex"

class TexMatrix < Matrix
  def TexMatrix.[](*rows)
    TexMatrix.rows(rows)
  end

  def to_tex type='b'
    '\begin{' + type + 'matrix}' + to_a.map {|row| row.join(' & ')}.join(' \\\\') + '\end{' + type + 'matrix}'
  end

  def char_eq_tex
    a, b, c = 1, -trace, determinant
    case row_size
    when 2 then
      "\\begin{align}"+
        "(#{self[0,0]} - \\lambda)(#{self[1,1]} - \\lambda) - (#{self[0,1]})(#{self[1,0]}) &= 0\\\\"+
        "\\lambda ^2 #{with_sign b}\\lambda #{with_sign c} &= 0"+
        "\\end{align}"
    else raise "Size too big to calculate eigenvalues"
    end
  end

  def eigen_values
    a, b, c = 1, -trace, determinant
    rhs = Math.sqrt(Complex(b**2 - 4*a*c))
    [(-b + rhs)/2*a, (-b - rhs) / 2*a]
  end

  def eigen_values_tex
    e1, e2 = eigen_values
    "\\lambda_1 = #{format_num(e1, 3)}\\\\ \\lambda_2 = #{format_num(e2, 3)}"
  end

  def to_wolfram
    '{{' + to_a.map {|row| row.join(',')}.join('},{') + '}}'
  end
end

def format_num x, n
  if x.kind_of? Complex
    Complex(x.real.round(n), x.imag.round(n))
  else
    x.round(n)
  end
end

def with_sign x
  (x >= 0 ? "+#{x}" : x).to_s
end
