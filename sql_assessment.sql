CREATE TABLE `progress` (
  `user_id` varchar(24) DEFAULT NULL,
  `learn_cpp` varchar(9) DEFAULT NULL,
  `learn_sql` varchar(9) DEFAULT NULL,
  `learn_html` varchar(9) DEFAULT NULL,
  `learn_javascript` varchar(9) DEFAULT NULL,
  `learn_java` varchar(9) DEFAULT NULL
);
CREATE TABLE `users` (
  `user_id` varchar(24) DEFAULT NULL,
  `email_domain` varchar(29) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `city` varchar(23) DEFAULT NULL,
  `postal` varchar(8) DEFAULT NULL,
  `mobile_app` varchar(11) DEFAULT NULL,
  `sign_up_at` varchar(0) DEFAULT NULL
);
--type below command to correct error msg on "--secure-file-priv"
set global local_infile = 1;

--before loading data open csv files with a text editor to check the boundaries
load data local infile "/Users/francisang/desktop/sql-codecademy-
learners-starting 2/progress.csv" into table progress fields terminated 
by "," lines terminated by '\n';

load data local infile "/Users/francisang/desktop/sql-codecademy-
learners-starting 2/users.csv" into table users fields terminated 
by "," lines terminated by '\n';

select email_domain, count(*) from users group by 1 order by 2 desc limit 25;

select count(*) from users where city = 'New York';

select count(*) from users where mobile_app = 'mobile-user';

-- insert sqlite query below into codecademy query window as we don't have sqlite
SELECT sign_up_at,
   strftime('%S', sign_up_at)
FROM users
GROUP BY 1
LIMIT 20;

--end of sqlite query

select * from users t1 inner join progress t2 on t1.user_id = t2.user_id
where city = 'New York';

select * from users t1 inner join progress t2 on t1.user_id = t2.user_id
where city = 'Chicago';
