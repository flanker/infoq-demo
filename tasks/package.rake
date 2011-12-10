DEV_ROOT = "#{PROJECT_ROOT}/dev"
name = "infoq"

def get_version
  Time.new.strftime("%Y%m%d%H%M")
end

desc "clean up tmp files"
task :clean do
  rm_rf "#{DEV_ROOT}/tmp"
end

desc "package"
task :package => [:clean, :package_deb, :publish]

def copy_content
  Dir.chdir DEV_ROOT do
    package_dir = "tmp/package/root/opt/infoq"
    mkdir_p package_dir
    cp_r "app", package_dir
  end
end

def copy_config
  Dir.chdir DEV_ROOT do
    package_dir = "tmp/package/root/etc/init.d"
    mkdir_p package_dir
    cp "config/infoq", package_dir
  end
end

desc "package to deb"
task :package_deb do
  copy_content
  copy_config

  Dir.chdir "#{DEV_ROOT}/tmp/package" do
    system <<-EOF
fpm -s dir \
  -t deb \
  -C root \
  -a all \
  -n #{name} \
  -v #{get_version} \
  -m "Feng Zhichao" \
  --description "a demo project for infoq" \
  --post-install "../../script/postinstall.sh" \
  .
    EOF

  end
end

desc "publish artifacts to repository"
task :publish do
  
end
