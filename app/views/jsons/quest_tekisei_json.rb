class QuestTekiseiJSON
  def getMessage(quest_info)
    images = create_image_json(quest_info)
    contents = create_contents_json(quest_info)

    message = {
      "type": "flex",
      "altText": "攻略適正",
      "contents": {
        "type": "bubble",
        "header": {
          "type": "box",
          "layout": "vertical",
          "contents": [
            {
              "type": "text",
              "text": "攻略適正",
              "weight": "bold",
              "size": "xl"
            },
            {
              "type": "separator",
              "margin": "md"
            }
          ]
        },
        "body": {
          "type": "box",
          "layout": "horizontal",
          "spacing": "md",
          "contents": [
            {
              "type": "box",
              "layout": "vertical",
              "flex": 1,
              "contents": images
            },
            {
              "type": "box",
              "layout": "vertical",
              "flex": 3,
              "contents": contents
            }
          ]
        }
      }
    }
    # message = {
    #   "type": "flex",
    #   "altText": "攻略適正",
    #   "contents": {
    #     "type": "bubble",
    #     "header": {
    #       "type": "box",
    #       "layout": "vertical",
    #       "contents": [
    #         {
    #           "type": "text",
    #           "text": "攻略適正",
    #           "weight": "bold",
    #           "size": "xl"
    #         },
    #         {
    #           "type": "separator",
    #           "margin": "md"
    #         }
    #       ]
    #     },
    #     "body": {
    #       "type": "box",
    #       "layout": "horizontal",
    #       "spacing": "md",
    #       "contents": [
    #         {
    #           "type": "box",
    #           "layout": "vertical",
    #           "flex": 1,
    #           "contents": [
    #             {
    #               "type": "text",
    #               "text": "Sランク",
    #               "gravity": "center",
    #               "align": "center",
    #               "size": "xxs",
    #               "weight": "bold",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "image",
    #               "url": "https://gamewith.akamaized.net/article_tools/monst/gacha/3661.jpg",
    #               "aspectMode": "cover",
    #               "aspectRatio": "1:1",
    #               "size": "sm",
    #               "gravity": "center",
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "image",
    #               "url": "https://gamewith.akamaized.net/article_tools/monst/gacha/3661.jpg",
    #               "aspectMode": "cover",
    #               "aspectRatio": "1:1",
    #               "size": "sm",
    #               "gravity": "center",
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "image",
    #               "url": "https://gamewith.akamaized.net/article_tools/monst/gacha/3661.jpg",
    #               "aspectMode": "cover",
    #               "aspectRatio": "1:1",
    #               "size": "sm",
    #               "gravity": "center",
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "image",
    #               "url": "https://gamewith.akamaized.net/article_tools/monst/gacha/3661.jpg",
    #               "aspectMode": "cover",
    #               "aspectRatio": "1:1",
    #               "size": "sm",
    #               "gravity": "center",
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "image",
    #               "url": "https://gamewith.akamaized.net/article_tools/monst/gacha/3661.jpg",
    #               "aspectMode": "cover",
    #               "aspectRatio": "1:1",
    #               "size": "sm",
    #               "gravity": "center",
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "image",
    #               "url": "https://gamewith.akamaized.net/article_tools/monst/gacha/3661.jpg",
    #               "aspectMode": "cover",
    #               "aspectRatio": "1:1",
    #               "size": "sm",
    #               "gravity": "center",
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "image",
    #               "url": "https://gamewith.akamaized.net/article_tools/monst/gacha/3661.jpg",
    #               "aspectMode": "cover",
    #               "aspectRatio": "1:1",
    #               "size": "sm",
    #               "gravity": "center",
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "image",
    #               "url": "https://gamewith.akamaized.net/article_tools/monst/gacha/3661.jpg",
    #               "aspectMode": "cover",
    #               "aspectRatio": "1:1",
    #               "size": "sm",
    #               "gravity": "center",
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "image",
    #               "url": "https://gamewith.akamaized.net/article_tools/monst/gacha/3661.jpg",
    #               "aspectMode": "cover",
    #               "aspectRatio": "1:1",
    #               "size": "sm",
    #               "gravity": "center",
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "image",
    #               "url": "https://gamewith.akamaized.net/article_tools/monst/gacha/3661.jpg",
    #               "aspectMode": "cover",
    #               "aspectRatio": "1:1",
    #               "size": "sm",
    #               "gravity": "center",
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "image",
    #               "url": "https://gamewith.akamaized.net/article_tools/monst/gacha/3661.jpg",
    #               "aspectMode": "cover",
    #               "aspectRatio": "1:1",
    #               "size": "sm",
    #               "gravity": "center",
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             }
    #           ]
    #         },
    #         {
    #           "type": "box",
    #           "layout": "vertical",
    #           "flex": 3,
    #           "contents": [
    #             {
    #               "type": "text",
    #               "text": "おすすめキャラ",
    #               "gravity": "center",
    #               "align": "center",
    #               "size": "xxs",
    #               "weight": "bold",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "text",
    #               "text": "小野小町（神化）【貫通/バランス/魔人】アビ：AGB/ドレイン+AB/毒キラー敵を一筆書きしやすい性能。",
    #               "gravity": "top",
    #               "size": "xxs",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "text",
    #               "text": "小野小町（神化）\n【貫通/バランス/魔人】\nアビ：AGB/ドレイン+AB/毒キラー\n敵を一筆書きしやすい性能。",
    #               "gravity": "top",
    #               "size": "xxs",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "text",
    #               "text": "小野小町（神化）\n【貫通/バランス/魔人】\nアビ：AGB/ドレイン+AB/毒キラー\n敵を一筆書きしやすい性能。",
    #               "gravity": "top",
    #               "size": "xxs",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "text",
    #               "text": "小野小町（神化）\n【貫通/バランス/魔人】\nアビ：AGB/ドレイン+AB/毒キラー\n敵を一筆書きしやすい性能。",
    #               "gravity": "top",
    #               "size": "xxs",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "text",
    #               "text": "小野小町（神化）\n【貫通/バランス/魔人】\nアビ：AGB/ドレイン+AB/毒キラー\n敵を一筆書きしやすい性能。",
    #               "gravity": "top",
    #               "size": "xxs",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "text",
    #               "text": "小野小町（神化）\n【貫通/バランス/魔人】\nアビ：AGB/ドレイン+AB/毒キラー\n敵を一筆書きしやすい性能。",
    #               "gravity": "top",
    #               "size": "xxs",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "text",
    #               "text": "小野小町（神化）\n【貫通/バランス/魔人】\nアビ：AGB/ドレイン+AB/毒キラー\n敵を一筆書きしやすい性能。",
    #               "gravity": "top",
    #               "size": "xxs",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "text",
    #               "text": "小野小町（神化）\n【貫通/バランス/魔人】\nアビ：AGB/ドレイン+AB/毒キラー\n敵を一筆書きしやすい性能。",
    #               "gravity": "top",
    #               "size": "xxs",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "text",
    #               "text": "小野小町（神化）\n【貫通/バランス/魔人】\nアビ：AGB/ドレイン+AB/毒キラー\n敵を一筆書きしやすい性能。",
    #               "gravity": "top",
    #               "size": "xxs",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "text",
    #               "text": "小野小町（神化）\n【貫通/バランス/魔人】\nアビ：AGB/ドレイン+AB/毒キラー\n敵を一筆書きしやすい性能。",
    #               "gravity": "top",
    #               "size": "xxs",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             },
    #             {
    #               "type": "text",
    #               "text": "小野小町（神化）\n【貫通/バランス/魔人】\nアビ：AGB/ドレイン+AB/毒キラー\n敵を一筆書きしやすい性能。",
    #               "gravity": "top",
    #               "size": "xxs",
    #               "wrap": true,
    #               "flex": 1
    #             },
    #             {
    #               "type": "separator",
    #               "margin": "md"
    #             }
    #           ]
    #         }
    #       ]
    #     }
    #   }
    # }
    return  message
  end

  # private
  def create_image_json(tekisei_infos)
    images_json = []
    duplicated_words = []
    tekisei_infos.each do |tekisei_info|
      if tekisei_info.get_header_rank.nil?
        parts = {
          "type": "image",
          "url": tekisei_info.get_img_url,
          "aspectMode": "cover",
          "aspectRatio": "1:1",
          "size": "xxs",
          "gravity": "center",
          "flex": 1
        },
        {
          "type": "separator",
          "margin": "md"
        }
        images_json << parts
      else
        if duplicated_words.include?(tekisei_info.get_header_rank)
          break
        end
        duplicated_words << tekisei_info.get_header_rank

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
        images_json << parts
      end
    end
    p images_json.flatten!
    # tes = []
    # images_json.each_with_index do |data, index|
    #   if index > 3
    #     break
    #   end
    #   tes << data
    # end
    # p tes
    # return tes
    return images_json
  end

  # private
  def create_contents_json(tekisei_infos)
    contens_json = []
    duplicated_words = []
    tekisei_infos.each do |tekisei_info|
      if tekisei_info.get_header_rank.nil?
        parts = {
          "type": "text",
          "text": tekisei_info.get_contents,
          "gravity": "top",
          "size": "xxs",
          "wrap": true,
          "maxLines": 4,
          "flex": 1
        },
        {
          "type": "separator",
          "margin": "md"
        }
        contens_json << parts
      else
        if duplicated_words.include?(tekisei_info.get_header_rank)
          break
        end
        duplicated_words << tekisei_info.get_header_rank

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
        contens_json << parts
      end
    end
    p contens_json.flatten!
    # tes = []
    # contens_json.each_with_index do |data, index|
    #   if index > 3
    #     break
    #   end
    #   tes << data
    # end
    # p tes
    # return tes
    return contens_json
  end
end
