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
