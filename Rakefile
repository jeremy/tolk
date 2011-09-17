require 'rubygems'
require 'bundler/setup'
require 'tolk/engine'

require 'rake'
require 'rake/testtask'
load 'tasks/tolk_tasks.rake'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end
