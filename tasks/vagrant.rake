namespace :vagrant do
  [:up, :halt, :suspend, :provision].each do |command|
    namespace command do
      [:go, :jenkins].each do |node|
        
        desc "vagrant #{command} #{node}"
        task node do
          Dir.chdir "#{PROJECT_ROOT}/nodes/#{node}" do
            system "vagrant #{command}"
          end
        end

      end
    end
  end
end
