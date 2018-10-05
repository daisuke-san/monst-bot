class ScrapingService
  require 'nokogiri'
  
  def scraiping
    html_monst = open('https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/')
    doc = Nokogiri::HTML.parse(html_monst)
    doc1 = doc.css('.monst_schedule_table')[0]
    row = []
    col1 = nil
    col2 = nil
    col3 = nil
    col4 = nil

    doc1.css('table tr td').each_with_index do |link, i|
      i += 1
      if i % 4 == 1
        col1 = link.content
      elsif i % 4 == 2
        col2 = link.content
      elsif i % 4 == 3
        col3 = link.content
      else
        col4 = link.content
        row << [col1, col2, col3, col4]
     end
    end

    str = ""
    row.each do |_col1, _col2, _col3, _col4|
      str = str << "#{_col1} : #{_col2}\n"
    end
    message = {
      type: 'text',
      text: str
    }
    return message
  end
end
