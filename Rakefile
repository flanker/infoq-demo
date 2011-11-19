require 'cucumber'
require 'cucumber/rake/task'

PROJECT_ROOT = File.dirname(__FILE__)

Dir.glob('tasks/*.rake').each { |task| load task }

namespace :app do

  desc "start local app server"
  task :start do
    start_app
  end

  Cucumber::Rake::Task.new(:cucumber) do |t|
    t.cucumber_opts = ["features"]
  end

  def start_app
    Dir.chdir "#{PROJECT_ROOT}/dev/app" do
      check_dependency
      system "node app.js"
    end
    puts "app started."
  end

  def check_dependency
    system "npm install -d"
  end

end
