require 'cucumber'
require 'cucumber/rake/task'

PROJECT_ROOT = File.dirname(__FILE__)

Dir.glob('tasks/*.rake').each { |task| load task }

namespace :app do

  desc "run acceptance test locally"
  task :acceptance => check_dependency do
    app_pid = fork {
      start_app
    }
    Rake::Task['app:cucumber'].execute
    Process.kill "HUP", app_pid
  end

  desc "install depandency"
  task :check_dependency do
    Dir.chdir "#{PROJECT_ROOT}/dev/app" do
      check_dependency
    end
  end

  desc "start local app server"
  task :start => check_dependency do
    start_app
  end

  Cucumber::Rake::Task.new(:cucumber) do |t|
    t.cucumber_opts = ["features"]
  end

  def start_app
    Dir.chdir "#{PROJECT_ROOT}/dev/app" do
      exec("node app.js")
    end
  end

  def check_dependency
    system "npm install -d"
  end

end
