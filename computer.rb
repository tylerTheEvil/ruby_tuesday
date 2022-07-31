# frozen_string_literal: true

# Computer class
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(method_name, *args)
    @component = method_name.to_s

    if @data_source.respond_to?(info_method_name) && @data_source.respond_to?(price_method_name)
      info = info_method.call(@id)
      price = price_method.call(@id)
      result = "#{@component.capitalize}: #{info} ($#{price})"
      return "* #{result}" if price >= 100

      result
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    @component = method_name
    @data_source.respond_to?(info_method.name) && @data_source.respond_to?(price_method.name)
  end

  private

  def info_method_name
    "get_#{@component}_info"
  end

  def price_method_name
    "get_#{@component}_price"
  end

  def info_method
    @data_source.method info_method_name
  end

  def price_method
    @data_source.method price_method_name
  end
end
