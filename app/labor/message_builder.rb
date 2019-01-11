class MessageBuilder
  attr_reader :data

  def initialize(data)
    @data = data.slice('content', 'username', 'color')
  end

  SUBSTITUTIONS = {
    zig: '![zig](https://i.imgur.com/IQ0Pznk.png)',
  }

  SUB_KEYS = SUBSTITUTIONS.keys.map { |k| "/#{k}" }.join('|')

  def to_message!
    @data['content'].gsub!(/#{SUB_KEYS}/) { |kword|
      SUBSTITUTIONS[kword.delete('/').to_sym]
        .gsub('USERNAME', @data['username'])
        .gsub('COLOR', @data['color'])
    }

    Message.create!(@data)
  end
end