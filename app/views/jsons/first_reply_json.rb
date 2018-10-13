class FirstReplyJSON
  def getMessage(input_message)
    message = {
      type: 'text',
      text: "#{input_message}だな\n待ってろってばよ"
    }
    return  message
  end
end
