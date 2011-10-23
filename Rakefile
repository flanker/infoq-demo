DEV_ROOT = File.dirname(__FILE__) + "/dev"
name = "infoq"

def get_version
  Time.new.strftime("%Y%m%d%H%M")
end

desc "clean up tmp files"
task :clean do
  rm_rf "#{DEV_ROOT}/tmp"
end

desc "package"
task :package => [:clean, :package_deb]

desc "package to deb"
task :package_deb do
  Dir.chdir DEV_ROOT do
    package_dir = "tmp/root/opt/infoq"
    mkdir_p package_dir
    cp_r "app", package_dir
  end
  Dir.chdir "#{DEV_ROOT}/tmp" do
    # system <<-EOF
    system <<-EOF
fpm -s dir \
  -t deb \
  -C root \
  -a all \
  -n #{name} \
  -v #{get_version} \
  -m "Feng Zhichao" \
  --description "a demo project for infoq" \
  .
    EOF

  end
end
