# frozen_string_literal: true

require "simplecov"

class SimpleCovRelativePathFormatter
  def format(result)
    root = SimpleCov.root.to_s

    result.files.each do |file|
      next unless file.filename.start_with?(root)

      relative = file.filename.delete_prefix("#{root}/")
      file.instance_variable_set(:@filename, relative)
    end

    result
  end
end
