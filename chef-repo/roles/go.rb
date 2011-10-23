name "go"
description "install go"
run_list "role[base]", "recipe[java::sun]", "recipe[git]", "recipe[go]"
