class LinebotController < ApplicationController
  require 'line/bot'  # gem 'line-bot-api'
  #require 'nokogiri'
  require 'open-uri'
  require 'sanitize'
  require_relative '../services/scraping_service.rb'

  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery :except => [:callback]

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_ACCESS_TOKEN"]
    }
  end

  # def scraiping
  #   html_monst = open('https://xn--eckwa2aa3a9c8j8bve9d.gamewith.jp/')
  #   doc = Nokogiri::HTML.parse(html_monst)
  #   doc1 = doc.css('.monst_schedule_table')[0]
  #   row = []
  #   col1 = nil
  #   col2 = nil
  #   col3 = nil
  #   col4 = nil
  #
  #   doc1.css('table tr td').each_with_index do |link, i|
  #     i += 1
  #     if i % 4 == 1
  #       col1 = link.content
  #     elsif i % 4 == 2
  #       col2 = link.content
  #     elsif i % 4 == 3
  #       col3 = link.content
  #     else
  #       col4 = link.content
  #       row << [col1, col2, col3, col4]
  #    end
  #   end
  #
  #   str = ""
  #   row.each do |_col1, _col2, _col3, _col4|
  #     str = str << "#{_col1} : #{_col2}\n"
  #   end
  #   message = {
  #     type: 'text',
  #     text: str
  #   }
  # end

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end

    events = client.parse_events_from(body)
    scraping_service = ScrapingService.new()

    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = scraping_service.scraping
          # message = {
          #   type: 'text',
          #   text: event.message['text']
          # }
          # client.reply_message(event['replyToken'], message)
          client.reply_message(event['replyToken'], message)
        end
      end
    }
    head :ok
  end

end
