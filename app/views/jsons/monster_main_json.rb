class MonsterMainJSON
  REPLY_MESSAGE = {
  "type": "flex",
  "altText": "モンスター詳細",
  "contents": {
    "type": "bubble",
    "hero": {
      "type": "image",
      "url": "https://gamewith.akamaized.net/article/thumbnail/rectangle/86426.png",
      "size": "full",
      "aspectRatio": "2:1",
      "aspectMode": "cover",
      "action": {
        "type": "uri",
        "uri": "http://linecorp.com/"
      }
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
              "type": "icon",
              "url": "https://gamewith.akamaized.net//assets/images/games/monst/db/attribute04.png",
              "margin": "none",
              "size": "lg",
              "aspectRatio": "1:1"
            },
            {
              "type": "text",
              "text": "イシュキガル",
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
                "label": "進化",
                "text": "[イシュキガル 進化]"
              },
              "flex": 1
            },
            {
              "type": "button",
              "style": "link",
              "height": "sm",
              "action": {
                "type": "message",
                "label": "神化",
                "text": "[イシュキガル 神化]"
              },
              "flex": 1
            },
            {
              "type": "button",
              "style": "link",
              "height": "sm",
              "action": {
                "type": "message",
                "label": "獣神化",
                "text": "[イシュキガル 獣神化]"
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
                "label": "モンスター評価",
                "text": "[イシュキガル 評価]"
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
                "label": "おすすめのわくわくの実",
                "text": "[イシュキガル おすすめ わくわく]"
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
                "label": "入手方法",
                "text": "[イシュキガル 入手方法]"
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
                "uri": "https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/article/show/86426"
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
