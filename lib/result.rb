# frozen_string_literal: true

class Result
  attr_reader :value, :error

  def initialize(value, error = nil)
    @value = value
    @error = error
  end

  def success?
    @error.nil?
  end

  def failure?
    !success?
  end
end
