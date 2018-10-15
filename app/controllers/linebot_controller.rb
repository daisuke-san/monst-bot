class LinebotController < ApplicationController
  require 'line/bot'  # gem 'line-bot-api'
  #require 'nokogiri'
  require 'open-uri'
  require 'sanitize'

  require_relative '../services/scraping_service.rb'
  require_relative '../services/scraping_postback_service.rb'

  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery :except => [:callback]

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_ACCESS_TOKEN"]
    }
  end

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end

    events = client.parse_events_from(body)

    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = ScrapingService.new.scraping(event.message['text'])
          puts message
          client.reply_message(event['replyToken'], message)
        end
      when Line::Bot::Event::Postback
        message = ScrapingPostbackService.new.scraping_postback(event['postback']['data'])
        client.reply_message(event['replyToken'], message)
      end
    }
    head :ok
  end

end
