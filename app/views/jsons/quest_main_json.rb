class MonsterMainJSON
  REPLY_MESSAGE = {
  "type": "flex",
  "altText": "クエストメイン",
  "contents": {
    "type": "bubble",
    "hero": {
      "type": "image",
      "url": "https://gamewith.akamaized.net/img/f8c47f4602e695ee1ea34fef0027c5b6.jpg",
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
              "text": "Mオラゴン 攻略",
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
                "type": "message",
                "label": "ステージ一覧",
                "text": "[Mオラゴン ステージ一覧]"
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
                "text": "[Mオラゴン ギミック]"
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
                "text": "[Mオラゴン コツ]"
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
                "text": "[Mオラゴン 適正]"
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
                "text": "[Mオラゴン 運極適正]"
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
                "uri": "https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/article/show/122621"
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

end
