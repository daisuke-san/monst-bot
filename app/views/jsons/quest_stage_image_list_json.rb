class QuestStageImageListJSON
  def getMessage(quest_info)
    message = {
      "type": "template",
      "altText": "this is a image carousel template",
      "template": {
        "type": "image_carousel",
        "columns": [
          {
            "imageUrl": "https://gamewith.akamaized.net/img/2f487e194d0e3ba6b42d0fb2f852081f.jpg",
            "action": {
              "type": "postback",
              "label": "攻略へ",
              "data": "action=buy&itemid=111"
            }
          },
          {
            "imageUrl": "https://gamewith.akamaized.net/img/2f487e194d0e3ba6b42d0fb2f852081f.jpg",
            "action": {
              "type": "message",
              "label": "攻略へ",
              "text": "yes"
            }
          },
          {
            "imageUrl": "https://gamewith.akamaized.net/img/2f487e194d0e3ba6b42d0fb2f852081f.jpg",
            "action": {
              "type": "uri",
              "label": "攻略へ",
              "uri": "https://gamewith.akamaized.net/img/2f487e194d0e3ba6b42d0fb2f852081f.jpg"
            }
          }
        ]
      }
    }
    return  message
  end
end
