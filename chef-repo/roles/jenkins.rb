name "jenkins"
description "jenkins configuration"
run_list "role[base]", "recipe[java]", "recipe[jenkins]"
