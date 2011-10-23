go_server_filename = "go-server-#{node.go.version}.deb"

remote_file "/tmp/#{go_server_filename}" do
  source "#{node.go.download_url}/#{go_server_filename}"
  mode "0644"
  action :create_if_missing
end

package "go-server" do
  source "/tmp/#{go_server_filename}"
  provider Chef::Provider::Package::Dpkg
  action :install
end
