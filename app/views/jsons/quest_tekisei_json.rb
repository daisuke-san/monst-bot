class QuestTekiseiJSON
  def getMessage(tekisei_infos)

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
          "layout": "vertical",
          "spacing": "md",
          "contents": create_json(tekisei_infos)
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
  def create_json(tekisei_infos)
    message = []
    tekisei_infos.each do |tekisei_info|
      parts = {
        "type": "box",
        "layout": "horizontal",
        "flex": 1,
        "contents": create_row_json(tekisei_info)
      },
      {
        "type": "separator",
        "margin": "md"
      }
      message << parts
    end
    p message.flatten!
    return message
  end

  # private
  def create_row_json(tekisei_info)
    message = []
    if tekisei_info.get_header_rank.nil?
      parts = [
        {
          "type": "image",
          "url": tekisei_info.get_img_url,
          "aspectMode": "cover",
          "aspectRatio": "1:1",
          "size": "sm",
          "gravity": "center",
          "flex": 1
        },
        {
          "type": "text",
          "text": tekisei_info.get_contents,
          "gravity": "top",
          "size": "xxs",
          "wrap": true,
          "flex": 3
        }
      ]
      return parts
    else
      parts = [
        {
          "type": "text",
          "text": tekisei_info.get_header_rank,
          "gravity": "center",
          "size": "xxs",
          "weight": "bold",
          "wrap": true,
          "flex": 1
        },
        {
          "type": "text",
          "text": "おすすめキャラ",
          "gravity": "center",
          "size": "xxs",
          "weight": "bold",
          "wrap": true,
          "flex": 3
        }
      ]
      return parts
    end
  end
end
