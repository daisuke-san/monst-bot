require 'nokogiri'
require 'open-uri'
require 'sanitize'

def get_quest_main(line_input_message)
  p "ライン入力文字列：#{line_input_message}"
  quest_url = get_quest_url(line_input_message)
  quest_info = get_quest_info(quest_url)
end

def get_quest_url(line_input_message)
  html_monst = open("https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/article/show/3054")
  doc = Nokogiri::HTML.parse(html_monst)
  trigger_data = nil
  data = doc.css('.monst-table-size')
  data.css('td').each do |ele|
    if ele.text.include?(line_input_message)
      #モンスタ-名を含む親要素を取得
      trigger_data = ele.next
      #モンスタ-情報
      p "モンスター名：#{ele.text}"
    end
  end
  #クエストURL
  quest_url = trigger_data.css('a')[0]['href']
  p "クエストURL：#{quest_url}"
  return quest_url
end

def get_quest_info(quest_url)
  html_monst = open(quest_url)
  doc = Nokogiri::HTML.parse(html_monst)
  data = doc.css('#article-body')

  #titleスクレイピング
  title_name = data.css('h2')[0].text
  title_name.slice!("の攻略方法まとめ")
  p "クエストタイトル：#{title_name}"

  #クエスト画像スクレイピング
  header_image_url = data.css('img')[0]["data-original"]
  #古い攻略は配置が違うので。。
  if header_image_url.nil?
    header_image_url = data.css('img')[2]["src"]
  end
  p "クエスト画像URL：#{header_image_url}"

  #クエスト情報格納
  quest_info = QuestInfo.new
  quest_info.set_quest_url(quest_url)
  quest_info.set_title_name(title_name)
  quest_info.set_header_image_url(header_image_url)

  return quest_info
end

class QuestInfo
  @@quest_url = nil
  @@monster_name = nil
  @@title_name = nil
  @@header_image_url = nil

  def set_quest_url(quest_url)
    @@quest_url = quest_url
  end

  def get_quest_url
    return @@quest_url
  end

  def set_monster_name(monster_name)
    @@monster_name = monster_name
  end

  def get_monster_name
    return @@monster_name
  end

  def set_title_name(title_name)
    @@title_name = title_name
  end

  def get_title_name
    return @@title_name
  end

  def set_header_image_url(header_image_url)
    @@header_image_url = header_image_url
  end

  def get_header_image_url
    return @@header_image_url
  end
end

def get_quest_image_list(target_url)
  html_monst = open(target_url)
  doc = Nokogiri::HTML.parse(html_monst)
  trigger_data = nil
  # data = doc.css('#article-body').css('.c-progressive-img').css('img')
  # imgs = []
  # data.each_with_index do |record, i|
  #   if i < 10
  #     p record["data-original"]
  #     imgs.push(record["data-original"])
  #   end
  # end

  data = doc.css('#article-body')
  imgs = []
  data.each_with_index do |record|
    reg = /.*!/.match("record.text")
    p reg.post_match
    # if record.text !~ /第1ステージ!/
    #   p record.text
    # end
  end
  return imgs
end

def get_quest_tekisei_list(target_url)
  html_monst = open(target_url)
  doc = Nokogiri::HTML.parse(html_monst)
  trigger_data = nil

  data = doc.css('.monst-tekisei-table')
  tekisei_css = nil
  data.each do |record|
    if record.text.include?('攻略適正ランキング')
      tekisei_css = record
    end
  end

  tekisei_infos = []
  tekisei_css.css('table tr').each do |record|
    th = record.css('th')
    td = record.css('td')
    tekisei_info = TekiseiInfo.new

    if th.empty?
      td.each_with_index do |td_data, index|
        if index == 0
          tekisei_info.set_img_url(td.at('img')["data-original"])
        else
          tekisei_info.set_contents(td_data.text)
        end
      end
    elsif td.empty?
      th.each_with_index do |th_data, index|
        if index == 0
          tekisei_info.set_header_rank(th_data.text)
        end
      end
    else
      p "なんじゃこれ"
    end
    tekisei_infos << tekisei_info
  end
  tekisei_infos.each do |tekisei_info|
    p "#{tekisei_info.get_header_rank},#{tekisei_info.get_img_url},#{tekisei_info.get_contents}"
  end
  return tekisei_infos
end

class TekiseiInfo
  @header_rank = nil
  @img_url = nil
  @contents = nil

  def set_header_rank(header_rank)
    @header_rank = header_rank
  end

  def get_header_rank
    return @header_rank
  end

  def set_img_url(img_url)
    @img_url = img_url
  end

  def get_img_url
    return @img_url
  end

  def set_contents(contents)
    @contents = contents
  end

  def get_contents
    return @contents
  end
end

def create_image_json(tekisei_infos)
  message = []
  tekisei_infos.each do |tekisei_info|
    if tekisei_info.get_header_rank.nil?
      parts = {
        "type": "image",
        "url": tekisei_info.get_img_url,
        "aspectMode": "cover",
        "aspectRatio": "1:1",
        "size": "sm",
        "gravity": "center",
        "flex": 1
      },
      {
        "type": "separator",
        "margin": "md"
      }
      message << parts
    else
      parts = {
        "type": "text",
        "text": tekisei_info.get_header_rank,
        "gravity": "center",
        "align": "center",
        "size": "xxs",
        "weight": "bold",
        "wrap": true,
        "flex": 1
      },
      {
        "type": "separator",
        "margin": "md"
      }
      message << parts
    end
  end
  p message.flatten!
  return message
end

def create_contents_json(tekisei_infos)
  message = []
  tekisei_infos.each do |tekisei_info|
    if tekisei_info.get_header_rank.nil?
      parts = {
        "type": "text",
        "text": tekisei_info.get_contents,
        "gravity": "top",
        "size": "xxs",
        "wrap": true,
        "flex": 1
      },
      {
        "type": "separator",
        "margin": "md"
      }
      message << parts
    else
      parts = {
        "type": "text",
        "text": "おすすめキャラ",
        "gravity": "center",
        "align": "center",
        "size": "xxs",
        "weight": "bold",
        "wrap": true,
        "flex": 1
      },
      {
        "type": "separator",
        "margin": "md"
      }
      message << parts
    end
  end
  p message.flatten!
  return message
end

#Main処理
msg = "action=buy&itemid=111"
arr = msg.split("&")
action = arr[0].split("=")[1]
url = arr[1].split("=")[1]
p arr
p action
p url

# msg = get_quest_main(msg)
# get_quesst_image_list("https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/article/show/109143")
tekisei_infos = get_quest_tekisei_list("https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/article/show/123365")
create_image_json(tekisei_infos)
create_contents_json(tekisei_infos)
