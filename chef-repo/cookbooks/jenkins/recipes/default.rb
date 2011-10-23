case node['platform']
when "ubuntu", "debian"

  bash "add jenkins source" do
    code <<-EOF
      wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
      echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
      apt-get update
    EOF
  end

  package "jenkins" do
    options "--force-yes"
  end

else
  Chef::Log.error("Jenkins not supported on this platform in our recipes.")
end
