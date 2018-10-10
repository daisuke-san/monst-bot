class ScrapingService
  require 'nokogiri'

  MONST_URL = "https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/"

  def scraping(line_message)
    puts line_message
    if line_message == "イベント"
      str_event = get_event_schedule
      message = [
          {
            type: 'text',
            text: "[イベント]だな\n待ってろってばよ"
          },
          {
            type: 'text',
            text: "ほらよってばよ\n" << "#{str_event}"
          }
        ]
      return message
    elsif line_message.include?("禁忌")
      quest_link = get_quest_guide(line_message)
      if quest_link.nil?
        message = [
            {
              type: 'text',
              text: "んなのないってばよ"
            }
          ]
      else
        message = [
            {
              type: 'text',
              text: "[禁忌]だな\n待ってろってばよ"
            },
            {
              type: 'uri',
              text: quest_link
            }
          ]
      end
      # message = {
      #   "type": "template",
      #   "altText": "this is a image carousel template",
      #   "template": {
      #       "type": "image_carousel",
      #       "columns": [
      #           {
      #             "imageUrl": urls[1],
      #             "action": {
      #               "type": "uri",
      #               "label": "攻略サイトへ",
      #               "uri": "https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/article/show/107577"
      #             }
      #           },
      #           {
      #             "imageUrl": urls[2],
      #             "action": {
      #               "type": "message",
      #               "label": "Yes",
      #               "text": "yes"
      #             }
      #           },
      #           {
      #             "imageUrl": urls[3],
      #             "action": {
      #               "type": "uri",
      #               "label": "View detail",
      #               "uri": "http://example.com/page/222"
      #             }
      #           },
      #           {
      #             "imageUrl": urls[4],
      #             "action": {
      #               "type": "message",
      #               "label": "Yes",
      #               "text": "yes"
      #             }
      #           },
      #           {
      #             "imageUrl": urls[5],
      #             "action": {
      #               "type": "message",
      #               "label": "Yes",
      #               "text": "yes"
      #             }
      #           }
      #           # ,
      #           # {
      #           #   "imageUrl": urls[6],
      #           #   "action": {
      #           #     "type": "message",
      #           #     "label": "Yes",
      #           #     "text": "yes"
      #           #   }
      #           # },
      #           # {
      #           #   "imageUrl": urls[7],
      #           #   "action": {
      #           #     "type": "message",
      #           #     "label": "Yes",
      #           #     "text": "yes"
      #           #   }
      #           # },
      #           # {
      #           #   "imageUrl": urls[8],
      #           #   "action": {
      #           #     "type": "message",
      #           #     "label": "Yes",
      #           #     "text": "yes"
      #           #   }
      #           # },
      #           # {
      #           #   "imageUrl": urls[9],
      #           #   "action": {
      #           #     "type": "message",
      #           #     "label": "Yes",
      #           #     "text": "yes"
      #           #   }
      #           # },
      #           # {
      #           #   "imageUrl": urls[10],
      #           #   "action": {
      #           #     "type": "message",
      #           #     "label": "Yes",
      #           #     "text": "yes"
      #           #   }
      #           # },
      #           # {
      #           #   "imageUrl": urls[11],
      #           #   "action": {
      #           #     "type": "message",
      #           #     "label": "Yes",
      #           #     "text": "yes"
      #           #   }
      #           # },
      #           # {
      #           #   "imageUrl": urls[12],
      #           #   "action": {
      #           #     "type": "message",
      #           #     "label": "Yes",
      #           #     "text": "yes"
      #           #   }
      #           # },
      #           # {
      #           #   "imageUrl": urls[13],
      #           #   "action": {
      #           #     "type": "message",
      #           #     "label": "Yes",
      #           #     "text": "yes"
      #           #   }
      #           # },
      #           # {
      #           #   "imageUrl": urls[14],
      #           #   "action": {
      #           #     "type": "message",
      #           #     "label": "Yes",
      #           #     "text": "yes"
      #           #   }
      #           # },
      #           # {
      #           #   "imageUrl": urls[15],
      #           #   "action": {
      #           #     "type": "message",
      #           #     "label": "Yes",
      #           #     "text": "yes"
      #           #   }
      #           # }
      #       ]
      #   }
      # }
      return message
    else
      message = {
        type: 'text',
        text: "何いってっか分かんないってばよ\n螺旋丸くらわすぞ"
      }
      return message
    end
  end

  # イベント情報取得メソッド
  def get_event_schedule
    html_monst = open(MONST_URL)
    doc = Nokogiri::HTML.parse(html_monst)
    trigger_data = nil
    doc.css('h4').each do |data|
      if data.text == "通常降臨クエスト"
        trigger_data = data
      end
    end

    tables = trigger_data.parent

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

    str_message = ""
    row.each do |_col1, _col2, _col3, _col4|
      if _col2.nil?
        str_message = str_message << "【#{_col1}】\n"
      else
        str_message = str_message << "#{_col1} : #{_col2}\n"
      end
    end
    return str_message.truncate(1500)
  end

  #攻略情報取得
  def get_quest_guide(line_message)
    html_monst = open("https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/article/show/107577")
    doc = Nokogiri::HTML.parse(html_monst)

    str = ""
    if line_message.include?("秘")
      str = "秘ノ獄"
    elsif line_message.include?("15")
      str = "十五ノ獄"
    elsif line_message.include?("14")
      str = "十四ノ獄"
    elsif line_message.include?("13")
      str = "十三ノ獄"
    elsif line_message.include?("12")
      str = "十二ノ獄"
    elsif line_message.include?("11")
      str = "十一ノ獄"
    elsif line_message.include?("10")
      str = "十ノ獄"
    elsif line_message.include?("9")
      str = "九ノ獄"
    elsif line_message.include?("8")
      str = "八ノ獄"
    elsif line_message.include?("7")
      str = "七ノ獄"
    elsif line_message.include?("6")
      str = "六ノ獄"
    elsif line_message.include?("5")
      str = "五ノ獄"
    elsif line_message.include?("4")
      str = "四ノ獄"
    elsif line_message.include?("3")
      str = "三ノ獄"
    elsif line_message.include?("2")
      str = "二ノ獄"
    elsif line_message.include?("1")
      str = "一ノ獄"
    else
      str = "んなのねーよ。"
    end

    quest_link = nil
    doc.css('a').each do |data|
      if data.text == str
        quest_link = data['href']
        p data['href']
      end
    end
    p quest_link

    return quest_link

    # urls = []
    # tables = doc.css('.js-lazyload-img-wrap .c-progressive-img').each do |anchor|
    #   urls << anchor[:"data-original"]
    # end
    # return urls
  end

end
