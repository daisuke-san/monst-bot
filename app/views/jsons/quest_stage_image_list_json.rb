class QuestMainJSON
  def getMessage(quest_info)
    message = {
      "type": "flex",
      "altText": "クエストメイン",
      "contents": {
        "type": "bubble",
        "hero": {
          "type": "image",
          "url": quest_info.get_header_image_url,
          "size": "full",
          "aspectRatio": "3:1",
          "aspectMode": "cover"
        },
        "body": {
          "type": "box",
          "layout": "vertical",
          "spacing": "md",
          "contents": [
            {
              "type": "box",
              "layout": "baseline",
              "margin": "xxl",
              "contents": [
                {
                  "type": "text",
                  "text": quest_info.get_title_name,
                  "wrap": true,
                  "weight": "bold",
                  "gravity": "center",
                  "margin": "md",
                  "size": "xl",
                  "flex": 0
                }
              ]
            },
            {
              "type": "separator",
              "margin": "xxl"
            },
            {
              "type": "box",
              "layout": "horizontal",
              "margin": "md",
              "contents": [
                {
                  "type": "button",
                  "style": "link",
                  "height": "sm",
                  "action": {
                    "type": "postback",
                    "label": "ステージ一覧",
                    "data": "action=ステージ一覧&url=#{quest_info.get_quest_url}",
                    "displayText": "ステージ一覧"
                  },
                  "flex": 1
                }
              ]
            },
            {
              "type": "separator",
              "margin": "md"
            },
            {
              "type": "box",
              "layout": "horizontal",
              "margin": "md",
              "contents": [
                {
                  "type": "button",
                  "style": "link",
                  "height": "sm",
                  "action": {
                    "type": "message",
                    "label": "ギミック",
                    "text": "[#{quest_info.get_quest_url} ギミック]"
                  },
                  "flex": 1
                },
                {
                  "type": "button",
                  "style": "link",
                  "height": "sm",
                  "action": {
                    "type": "message",
                    "label": "コツ",
                    "text": "[#{quest_info.get_quest_url} コツ]"
                  },
                  "flex": 1
                }
              ]
            },
            {
              "type": "separator",
              "margin": "md"
            },
            {
              "type": "box",
              "layout": "horizontal",
              "margin": "md",
              "contents": [
                {
                  "type": "button",
                  "style": "link",
                  "height": "sm",
                  "action": {
                    "type": "message",
                    "label": "適正",
                    "text": "[#{quest_info.get_quest_url} 適正]"
                  },
                  "flex": 1
                },
                {
                  "type": "button",
                  "style": "link",
                  "height": "sm",
                  "action": {
                    "type": "message",
                    "label": "運極適正",
                    "text": "[#{quest_info.get_quest_url} 運極適正]"
                  },
                  "flex": 1
                }
              ]
            },
            {
              "type": "separator",
              "margin": "md"
            },
            {
              "type": "box",
              "layout": "horizontal",
              "margin": "md",
              "contents": [
                {
                  "type": "button",
                  "style": "secondary",
                  "height": "sm",
                  "action": {
                    "type": "uri",
                    "label": "もっと見る",
                    "uri": quest_info.get_quest_url
                  },
                  "flex": 1
                }
              ]
            },
            {
              "type": "separator",
              "margin": "md"
            }
          ]
        }
      }
    }
    return  message
  end
end
