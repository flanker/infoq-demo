file "/tmp/test1" do
  owner "root"
  group "root"
end

result = File.exists?("/tmp/test1").to_s

file "/tmp/test2" do
  owner "root"
  group "root"
  not_if { File.exists?("/tmp/test1") }
end

file "/tmp/#{result}" do
  owner "root"
  group "root"
end
