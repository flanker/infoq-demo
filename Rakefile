PROJECT_ROOT = File.dirname(__FILE__)

Dir.glob('tasks/*.rake').each { |task| load task }

namespace :app do
  desc "start local app server"
  task :start do
    Dir.chdir "#{PROJECT_ROOT}/dev/app" do
      check_dependency
      system "node app.js"
    end
  end

  def check_dependency
    system "npm install -d"
  end
end
