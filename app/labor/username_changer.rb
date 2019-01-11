class UsernameChanger
  RESERVED = %w|
    system
  |

  SYSTEM_COLOR = '#ffffff'

  def initialize(data)
    @new = data['new_username']
    @old = data['old_username']

    @new_color = data['new_color']
    @old_color = data['old_color']
  end

  def change!
    return reserved! if @new.in?(RESERVED)

     content = 
      if had_old_username?
        <<~HTML
          <span class="username" style="color: #{@old_color}">
            #{@old}
          </span>
          has changed their username to
          <span class="username" style="color: #{@new_color}">
            #{@new}
          </span>.
        HTML
      else
        <<~HTML
          <span class="username" style="color: #{@new_color}">
            #{@new}
          </span>
          has sat down at the campfire...
        HTML
      end

    Message.create!(
      username: 'system', 
      content: content, 
      color: SYSTEM_COLOR,
    )

    ActionCable.server.broadcast('campfire_channel',
      type: 'set_name',
      name: @new,
    )
  end

  private

  def had_old_username?
    @old.present?
  end

  def reserved!
    ActionCable.server.broadcast('campfire_channel',
      type: 'name_reserved',
    )
  end
end