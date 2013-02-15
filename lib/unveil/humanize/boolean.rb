module Humanize
  class Boolean
    def self.express(field_value)
      new(field_value).yesno
    end

    def yesno
      field_value ? 'Yes' : 'No'
    end

    private

    attr_reader :field_value
    def initialize(field_value)
      @field_value = !!field_value
    end
  end
end
