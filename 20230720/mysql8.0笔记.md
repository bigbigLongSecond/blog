
## 2023-07-31
```
session global
session 是会话级别，仅对当前连接管用。 global  全局修改，修改的参数只对新连接的会话生效。
show (global) variable like 'log_error'; set (global) xxx = '';
set long_query_time = 1.5;
show variables like 'long_query_time';
##查看所有连接的参数设置 （performance_schema）
select * from variables_by_thread where variable_name = 'long_query_time';
查看当前进程
show processlist;
select * from threads where PROCESSLIST_ID = 38 \G;
##mysql 验证是用户名 和ip 还有权限
创建一个用户，允许在任何ip下访问
create user 'david'@'%' identified by '123';
删除这个用户
drop user 'david'@'%' ;
授予权限
grant select,update,insert,delete on test.* to 'david'@'%';
授予 增删改查的权限， 作用域： test 库 所有的表  授予人'david'@'%';
```

## mysql 8.0 考试笔记

认考试：https://login.oracle.com/mysso/signon.jsp
364340618@qq.com
fpQX2z25,VmH

记MySQL 8.0 OCP 1Z0-908认证考试

考试大纲：https://mylearn.oracle.com/ou/exam/mysql-80-database-administrator-1z0-908/105037/110678/170386
https://blog.csdn.net/lukeUnique/article/details/131258422?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522168837847916800184171416%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=168837847916800184171416&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduend~default-4-131258422-null-null.142^v88^insert_down38v5,239^v2^insert_chatgpt&utm_term=1Z0-908&spm=1018.2226.3001.4187

https://mylearn.oracle.com/ou/learning-path/earn-the-mysql-80-database-admin-certified-professional-credential/97589/

教程：https://www.jianshu.com/u/44068ed972c7



---
## 参考文档及连接
[这是一个链接](https://pan.baidu.com/s/1DwGrfVHYYVWEiVrlVkogTg?pwd=h750)

提取码: h75o
wget http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.17-linux-glibc2.5-x86_64.tar.gz

wget http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.35-linux-glibc2.5-x86_64.tar.gz

wget http://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.0-dmr-linux-glibc2.12-x86_64.tar.gz

2023-07-30 \G 竖行显示
https://private-1253767630.cos.ap-shanghai.myqcloud.com/ansible-package/sanfor/%E8%BD%AF%E4%BB%B6%E8%AE%BE%E8%AE%A1%E5%B8%88.zip