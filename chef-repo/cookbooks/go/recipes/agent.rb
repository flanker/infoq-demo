#include_recipe "java"

go_agent_filename = "go-agent-#{node.go.version}.deb"

remote_file "/tmp/#{go_agent_filename}" do
  source "#{node.go.download_url}/#{go_agent_filename}"
  mode "0644"
  action :create_if_missing
end

package "go-agent" do
  source "/tmp/#{go_agent_filename}"
  provider Chef::Provider::Package::Dpkg
  action :install
end

template "/etc/default/go-agent" do
  mode "0644"
  owner "go"
  group "go"
  source "go-agent.conf.erb"
end

service "go-agent" do
  action [:enable, :start]
  pattern "agent.jar"
  start_command "/etc/init.d/go-agent start"
end
