module NamedParams

  module_function

  def required
    method = caller_locations(1,1)[0].label
    raise ArgumentError,
      "A required keyword argument was not specified when calling '#{method}'"
  end

end
