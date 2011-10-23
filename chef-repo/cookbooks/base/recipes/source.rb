if node['platform'] == "ubuntu"

  bash "update source" do
    code <<-EOF
      apt-get update
    EOF
  end

end
