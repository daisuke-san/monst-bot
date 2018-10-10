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
      urls = get_quest_guide
      message = {
        "type": "template",
        "altText": "this is a image carousel template",
        "template": {
            "type": "image_carousel",
            "columns": [
                {
                  "imageUrl": urls[1],
                  "action": {
                    "type": "uri",
                    "label": "攻略サイトへ",
                    "uri": "https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/article/show/107577"
                  }
                },
                {
                  "imageUrl": urls[2],
                  "action": {
                    "type": "message",
                    "label": "Yes",
                    "text": "yes"
                  }
                },
                {
                  "imageUrl": urls[3],
                  "action": {
                    "type": "uri",
                    "label": "View detail",
                    "uri": "http://example.com/page/222"
                  }
                },
                {
                  "imageUrl": urls[4],
                  "action": {
                    "type": "message",
                    "label": "Yes",
                    "text": "yes"
                  }
                },
                {
                  "imageUrl": urls[5],
                  "action": {
                    "type": "message",
                    "label": "Yes",
                    "text": "yes"
                  }
                }
                # ,
                # {
                #   "imageUrl": urls[6],
                #   "action": {
                #     "type": "message",
                #     "label": "Yes",
                #     "text": "yes"
                #   }
                # },
                # {
                #   "imageUrl": urls[7],
                #   "action": {
                #     "type": "message",
                #     "label": "Yes",
                #     "text": "yes"
                #   }
                # },
                # {
                #   "imageUrl": urls[8],
                #   "action": {
                #     "type": "message",
                #     "label": "Yes",
                #     "text": "yes"
                #   }
                # },
                # {
                #   "imageUrl": urls[9],
                #   "action": {
                #     "type": "message",
                #     "label": "Yes",
                #     "text": "yes"
                #   }
                # },
                # {
                #   "imageUrl": urls[10],
                #   "action": {
                #     "type": "message",
                #     "label": "Yes",
                #     "text": "yes"
                #   }
                # },
                # {
                #   "imageUrl": urls[11],
                #   "action": {
                #     "type": "message",
                #     "label": "Yes",
                #     "text": "yes"
                #   }
                # },
                # {
                #   "imageUrl": urls[12],
                #   "action": {
                #     "type": "message",
                #     "label": "Yes",
                #     "text": "yes"
                #   }
                # },
                # {
                #   "imageUrl": urls[13],
                #   "action": {
                #     "type": "message",
                #     "label": "Yes",
                #     "text": "yes"
                #   }
                # },
                # {
                #   "imageUrl": urls[14],
                #   "action": {
                #     "type": "message",
                #     "label": "Yes",
                #     "text": "yes"
                #   }
                # },
                # {
                #   "imageUrl": urls[15],
                #   "action": {
                #     "type": "message",
                #     "label": "Yes",
                #     "text": "yes"
                #   }
                # }
            ]
        }
      }
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
    return str_message.trancete(1997)
  end

  #攻略情報取得
  def get_quest_guide
    html_monst = open("https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/article/show/107577")
    doc = Nokogiri::HTML.parse(html_monst)
    urls = []
    tables = doc.css('.js-lazyload-img-wrap .c-progressive-img').each do |anchor|
      urls << anchor[:"data-original"]
    end
    return urls
  end

end
