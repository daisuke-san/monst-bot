class ScrapingService
  require 'nokogiri'
  require_relative '../views/jsons/kinki_main_json.rb'

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
      quest_name = get_kinki_quest_name(line_message)
      quest_url = get_kinki_quest_url(quest_name)
      if quest_url.nil?
        message = [
            {
              type: 'text',
              text: "んなのないってばよ"
            }
          ]
        return message
      end

      quest_tekisei = get_quest_tekisei(quest_url)
      message = [
          {
            type: 'text',
            text: "[禁忌の獄 #{quest_name}]だな\n待ってろってばよ"
          },
          {
            type: 'text',
            text: quest_url
          },
          {
            type: 'text',
            text: "適正はこれだってばよ\n#{quest_tekisei}"
          }
        ]
      return message
    elsif line_message == "あいう"
      message = KinkiMainJSON::REPLY_MESSAGE
      p message
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

  #禁忌の獄階数名称取得
  def get_kinki_quest_name(line_message)
    if line_message.include?("秘")
      return "秘ノ獄"
    elsif line_message.include?("15")
      return "十五ノ獄"
    elsif line_message.include?("14")
      return "十四ノ獄"
    elsif line_message.include?("13")
      return "十三ノ獄"
    elsif line_message.include?("12")
      return "十二ノ獄"
    elsif line_message.include?("11")
      return "十一ノ獄"
    elsif line_message.include?("10")
      return "十ノ獄"
    elsif line_message.include?("9")
      return "九ノ獄"
    elsif line_message.include?("8")
      return "八ノ獄"
    elsif line_message.include?("7")
      return "七ノ獄"
    elsif line_message.include?("6")
      return "六ノ獄"
    elsif line_message.include?("5")
      return "五ノ獄"
    elsif line_message.include?("4")
      return "四ノ獄"
    elsif line_message.include?("3")
      return "三ノ獄"
    elsif line_message.include?("2")
      return "二ノ獄"
    elsif line_message.include?("1")
      return "一ノ獄"
    else
      return nil
    end
  end

  #禁忌クエストURL取得
  def get_kinki_quest_url(quest_name)
    html_monst = open("https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/article/show/105857")
    doc = Nokogiri::HTML.parse(html_monst)

    quest_url = nil
    doc.css('a').each do |data|
      if data.text == quest_name
        quest_url = data['href']
        p data['href']
      end
    end
    p quest_url
    return quest_url
  end

  #攻略情報取得
  def get_quest_tekisei(quest_url)
    html_monst = open(quest_url)
    doc = Nokogiri::HTML.parse(html_monst)

    quest_tekisei = nil

    th_flg = false
    td_flg = false
    doc.css('.monst-tekisei-table').css('table tr').each do |data|
      headers = data.css('th')
      dtls = data.css('td')
      if headers.empty?
        if td_flg == true
          monster = dtls.css('a').at.text
          quest_tekisei = quest_tekisei << "#{monster}\n"
          td_flg = false
        else
          td_flg = true
        end
        p quest_tekisei
      elsif dtls.empty?
        if th_flg == false
          p dtls
          rank = headers[0].text
          quest_tekisei = quest_tekisei << "【#{rank}】\n"
          th_flg = true
        else
          th_flg = false
        end
        p quest_tekisei
      end
        # quest_tekisei = data['href']
        # p data['href']
    end
    p quest_tekisei
    return quest_tekisei

    # urls = []
    # tables = doc.css('.js-lazyload-img-wrap .c-progressive-img').each do |anchor|
    #   urls << anchor[:"data-original"]
    # end
    # return urls
  end

end
