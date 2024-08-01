# frozen_string_literal: true

module TimeSerice
  class TimeConfig
    attr_reader :default_minute

    def initialize(value = nil, &block)
      if !value.nil?
        @default_minute = value
      elsif block_given?
        @default_minute = block.call
      end
    end
  end

  class MinuteEditor < TimeConfig
    def add_minutes(time, additional_minutes)
      colon_index = time.index(':')
      space_index = time.index(/\s/)
      hours = time[0...colon_index].to_i
      minutes = time[colon_index + 1...space_index].to_i
      new_minutes = minutes + additional_minutes
      new_day_time = time[space_index + 1...time.length]
      additional_hours = if (new_minutes / 60) < 12
                           new_minutes / 60
                         else
                           new_day_time = get_day_time_by_hours((new_minutes / 60) / 12, new_day_time)
                           (new_minutes / 60) % 12
                         end

      new_minutes %= 60
      new_hours = if (hours + additional_hours) > 12
                    new_day_time = time[space_index + 1...time.length] == 'AM' ? 'PM' : 'AM'
                    (hours + additional_hours) - 12
                  else
                    hours + additional_hours
                  end

      "#{new_hours}:#{new_minutes < 10 ? "0#{new_minutes}" : new_minutes} #{new_day_time}"
    end

    private

    def get_day_time_by_hours(hours, day_time)
      return day_time if (hours % 2).zero?

      day_time == 'AM' ? 'PM' : 'AM'
    end
  end
end

minute_editor = TimeSerice::MinuteEditor.new 321
puts minute_editor.add_minutes('11:06 AM', 20)
