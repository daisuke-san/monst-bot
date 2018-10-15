class ScrapingPostbackService
  require 'nokogiri'

  require_relative '../services/scraping_quest_service.rb'

  require_relative '../views/jsons/first_reply_json.rb'
  require_relative '../views/jsons/quest_stage_image_list_json.rb'

  MONST_URL = "https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/"

  def scraping_postback(postback_data)
    array = postback_data.split("&")
    action_name = array[0].split("=")[1]
    target_url = array[1].split("=")[1]
    p action_name
    p target_url
    if action_name == "ステージ一覧"
      message = [
          FirstReplyJSON.new.getMessage(action_name),
          QuestStageImageListJSON.new.getMessage("test")
        ]
      return message
    end
  end

end
