require 'bundler'
require 'coveralls/rake/task'
require 'rspec/core/rake_task'
require 'rake/testtask'

Bundler::GemHelper.install_tasks

Coveralls::RakeTask.new

desc 'Run all specs'
RSpec::Core::RakeTask.new(:spec).rspec_opts= "--seed #{}"

desc 'Run all RSpec'
task :spec_with_seed, :value do |t, args|
  sh "rspec --seed #{args[:value].to_i.to_s}"
end
#=begin
desc 'Run all Test::Unit'
Rake::TestTask.new do |t, args|
  #srand 123
  #t.options= %Q{TESTOPTS="--seed=1261"}
  t.libs << "test"
  t.libs << "."
  t.test_files = FileList['test/test*.rb', 'test/legacy/test*.rb']
  t.verbose = true
  t.warning = true


  #t.seed= 123
  #TESTOPTS="--seed=1261"
#puts
#puts t.methods.sort
end
#=end

#task :test, :value do |t, args|
#Rake::TestTask.new do |t, args|
#  t.instance_eval "srand= 123"
#end



#task :default => [:spec, :test, 'coveralls:push']

desc 'default: run all tests and push coverage info to Coveralls'
task :default do |t, args|
  #args.with_defaults(:seed => :default_1)
  #puts "Args with defaults were: #{args}"
  Rake::Task[:seed].invoke(rand(65536))
  Rake.application.invoke_task("test TESTOPTS=--seed=1261")
end

desc 'seed[12345]: deterministically run all tests and push coverage info to Coveralls'
task :seed, :value do |t, args|
  puts "rake (with seed #{args[:value]}) ..."
  Rake::Task[:spec_with_seed].invoke(args[:value])
  #Rake::Task[:test].invoke(%Q{TESTOPTS="--seed=#{args[:value].to_i.to_s}"})
  #Rake::Task[:test].invoke
  #Rake.application.invoke_task(%Q{test TESTOPTS="--seed=#{args[:value].to_i.to_s}"})  #TESTOPTS="-v"
  #sh %Q{rake test TESTOPTS="--order=random --seed=#{args[:value].to_i.to_s}"}  #TESTOPTS="-v"
  sh %Q{rake test TESTOPTS="--order=random --seed=#{args[:value].to_i.to_s}"}  #TESTOPTS="-v"
  puts "rake seed[#{args[:value].to_i.to_s}] to rerun this test"
end
