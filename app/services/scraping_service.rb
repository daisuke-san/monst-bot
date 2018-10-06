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
    else
      message = {
        type: 'text',
        text: test_message
        # text: "何いってっかか分かんないってばよ\n螺旋丸くらわすぞ"
      }
      return message
    end
  end

  # イベント情報取得メソッド
  def get_event_schedule
    html_monst = open(MONST_URL)
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

    str_message = ""
    row.each do |_col1, _col2, _col3, _col4|
      if _col2.nil?
        str_message = str_message << "【#{_col1}】\n"
      else
        str_message = str_message << "#{_col1} : #{_col2}\n"
      end
    end

    return str_message
  end

  def test_message
    message = {
      "type": "flex",
      "altText": "#",
      "contents": {
          "type": "bubble",
          "hero": {
              "type": "image",
              "url": "https://s3-ap-northeast-1.amazonaws.com/xxxxxxx/hamburger.jpg",
              "size": "full",
              "aspectRatio": "20:13",
              "aspectMode": "cover",
              "action": {
                  "type": "uri",
                  "uri": "https://classmethod.jp/"
                }
              },
              "body": {
                "type": "box",
                "layout": "vertical",
                "spacing": "md",
                "action": {
                  "type": "uri",
                  "uri": "https://classmethod.jp/"
                },
                "contents": [
                  {
                    "type": "text",
                    "text": "Hamburger",
                    "size": "xl",
                    "weight": "bold"
                  },
                  {
                    "type": "box",
                    "layout": "vertical",
                    "spacing": "sm",
                    "contents": [
                      {
                        "type": "box",
                        "layout": "baseline",
                        "contents": [
                          {
                            "type": "icon",
                            "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/restaurant_regular_32.png"
                          },
                          {
                            "type": "text",
                            "text": "$10.5",
                            "weight": "bold",
                            "margin": "sm",
                            "flex": 0
                          },
                          {
                            "type": "text",
                            "text": "400kcl",
                            "size": "sm",
                            "align": "end",
                            "color": "#aaaaaa"
                          }
                        ]
                      }
                    ]
                  },
                  {
                    "type": "text",
                    "text": "Sauce, Onions, Pickles, Lettuce & Cheese",
                    "wrap": true,
                    "color": "#aaaaaa",
                    "size": "xxs"
                  }
                ]
              },
              "footer": {
                "type": "box",
                "layout": "vertical",
                "contents": [
                  {
                    "type": "spacer",
                    "size": "xxl"
                  },
                  {
                    "type": "button",
                    "style": "primary",
                    "color": "#905c44",
                    "action": {
                      "type": "message",
                      "label": "Order",
                      "text": "CM01_001"
                    }
                  }
                ]
              }
            }
          }
    return message
  end
end
