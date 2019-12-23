1、找出上次打包的git版本号，例如：6d912a7。   
2、进入目进入项目根目录，例如：cgb_seal。
3、执行命令：git diff 6d912a7 --name-only > build_increment/update_list.txt。
4、打开文本文件update_list.txt，去掉不需要的文件。
5、进入build_increment目录，执行./build_increment_war.sh或者Windows下双击build_increment_war.bat。
6、.zip、SY_SERV.zip、SY_SERV_DICT.zip。在build_increment目录会生成update