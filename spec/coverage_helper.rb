# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'
require "simplecov-json"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::JSONFormatter
])

SimpleCov.start 'rails' do
  SimpleCov.root File.expand_path("..", __dir__)

  enable_coverage :branch

  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/vendor/'
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/app/channels/'
  add_filter '/app/helpers/'

  add_filter '/app/jobs/application_job.rb'
  add_filter '/app/models/application_record.rb'
  add_filter '/app/mailers/application_mailer.rb'
  add_filter '/app/controllers/application_controller.rb'

  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Components', 'app/components'
  add_group 'Jobs', 'app/jobs'
  add_group 'Mailers', 'app/mailers'

  add_group 'ERP Accounts', 'engines/erp_accounts/app'
  add_group 'ERP Core', 'engines/erp_core/app'
  add_group 'ERP Users', 'engines/erp_users/app'
  add_group 'ERP Workers', 'engines/erp_workers/app'

  minimum_coverage 90
  minimum_coverage_by_file 70
end
