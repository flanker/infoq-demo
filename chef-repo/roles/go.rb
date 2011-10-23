name "go"
description "go configuration"
run_list "role[base]", "recipe[java::sun]", "recipe[git]", "recipe[go]"
