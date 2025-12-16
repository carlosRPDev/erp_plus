# frozen_string_literal: true

require "simplecov"

class SimpleCovRelativePathFormatter
  def format(result)
    result.files.each do |file|
      next unless file.filename.start_with?(SimpleCov.root)

      file.instance_variable_set(
        :@filename,
        file.filename.delete_prefix("#{SimpleCov.root}/")
      )
    end
  end
end
