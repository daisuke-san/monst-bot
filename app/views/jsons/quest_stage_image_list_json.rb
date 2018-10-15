class QuestStageImageListJSON
  def getMessage(images)
    message = {
      "type": "template",
      "altText": "this is a image carousel template",
      "template": {
        "type": "image_carousel",
        "columns": [
          {
            "imageUrl": images[0],
            "action": {
              "type": "postback",
              "label": "攻略へ",
              "data": "action=buy&itemid=111"
            }
          },
          {
            "imageUrl": images[1],
            "action": {
              "type": "postback",
              "label": "攻略へ",
              "data": "action=buy&itemid=111"
            }
          },
          {
            "imageUrl": images[2],
            "action": {
              "type": "postback",
              "label": "攻略へ",
              "data": "action=buy&itemid=111"
            }
          },
          {
            "imageUrl": images[3],
            "action": {
              "type": "postback",
              "label": "攻略へ",
              "data": "action=buy&itemid=111"
            }
          },
          {
            "imageUrl": images[4],
            "action": {
              "type": "postback",
              "label": "攻略へ",
              "data": "action=buy&itemid=111"
            }
          },
          {
            "imageUrl": images[5],
            "action": {
              "type": "postback",
              "label": "攻略へ",
              "data": "action=buy&itemid=111"
            }
          },
          {
            "imageUrl": images[6],
            "action": {
              "type": "postback",
              "label": "攻略へ",
              "data": "action=buy&itemid=111"
            }
          },
          {
            "imageUrl": images[7],
            "action": {
              "type": "postback",
              "label": "攻略へ",
              "data": "action=buy&itemid=111"
            }
          },
          {
            "imageUrl": images[8],
            "action": {
              "type": "postback",
              "label": "攻略へ",
              "data": "action=buy&itemid=111"
            }
          },
          {
            "imageUrl": images[9],
            "action": {
              "type": "postback",
              "label": "攻略へ",
              "data": "action=buy&itemid=111"
            }
          }
        ]
      }
    }
    return  message
  end
end
