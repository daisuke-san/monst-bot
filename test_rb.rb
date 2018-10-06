require 'nokogiri'
require 'open-uri'
require 'sanitize'

# input: HTML String
# output: HTML String の二次元配列

html_monst = open('https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/')
doc = Nokogiri::HTML.parse(html_monst)
tables = doc.css('.monst_schedule_table')[0]
row = []
col1 = nil
col2 = nil
col3 = nil
col4 = nil

tables.css('table tr').each_with_index do |table|
  headers = table.css('th')
  dtls = table.css('td')

  if headers.empty?
    dtls.each_with_index do |dtl, d_index|
      d_index += 1
      if d_index % 4 == 1
        col1 = dtl.content
      elsif d_index % 4 == 2
        col2 = dtl.content
      elsif d_index % 4 == 3
        col3 = dtl.content
      else
        col4 = dtl.content
        row << [col1, col2, col3, col4]
      end
  end
  else
    headers.each_with_index do |header, h_index|
      h_index += 1
      if h_index % 4 == 1
        col1 = header.content
        row << [col1]
      end
    end
  end
end

str = ""
row.each do |_col1, _col2, _col3, _col4|
  str = str << "#{_col1} : #{_col2}\n"
end
puts str
# puts doc2

# doc1.css('table tr td').each_with_index do |link, i|
#   i += 1
#   if i % 4 == 1
#     col1 = link.content
#   elsif i % 4 == 2
#     col2 = link.content
#   elsif i % 4 == 3
#     col3 = link.content
#   else
#     col4 = link.content
#     row << [col1, col2, col3, col4]
#  end
# end
#
# puts row
# str = ""
# row.each do |_col1, _col2, _col3, _col4|
#   str = str << "#{_col1} : #{_col2}\n"
# puts str
# end
