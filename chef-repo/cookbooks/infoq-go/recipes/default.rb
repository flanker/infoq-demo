remote_file "/etc/go/cruise-config.xml" do
  source node.go.config_file
  owner "go"
  group "go"
  mode "0644"
end
