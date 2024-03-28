create database `foreign key test`;
use `foreign key test`;
#先创建表格   构建employee表格
create table `employee`(
`emp_id` int primary key,
`name` varchar(20),
`birth_date` date,
`sex` varchar(1),
`salary` decimal(10,1),
`branch_id` int,
`sup_id` int
);
create table `branch`(
`branch_id` int primary key,
`branch_name` varchar(5),
`manager_id` int,
foreign key (`manager_id`) references `employee`(`emp_id`) on delete set null  #删掉后自动改为null	
);
alter table `employee`
add foreign key(`branch_id`)
references `branch`(`branch_id`)
on delete set null;
alter table `employee`
add foreign key(`sup_id`)
references `employee`(`emp_id`)
on delete set null;
create table `client`(
`client_id` int primary key,
`client_name` varchar(10),
`phone` int
);
create table `works_with`(
`emp_id` int ,
`client_id` int,
`total_sales` int,
primary key (`emp_id`,`client_id`),
foreign key(`emp_id`) references `employee`(`emp_id`) on delete cascade,#删除后跟着一起删掉
foreign key(`client_id`)references `client`(`client_id`)on delete cascade
);

drop table`works_with`;
drop table `client`;
drop table `branch`;
drop table `employee`;
describe `employee`;

insert into `branch` values(1,"keyan",null);
insert into `branch`values(2,"hayan",null);
insert into `branch`values(3,"zixun",null);
UPDATE `foreign key test`.`branch` SET `manager_id` = '208' WHERE (`branch_id` = '3');


select*from `branch`;
insert into `employee`(`emp_id`,`name`) values(206,"xiaohuang");
insert into `employee` values(206,"xiaohuang",'1998-10-08',"F",50000，1，null);
insert into `employee` values(207,"xiaolv",'1985-09-16',"M",29000,2,206);
insert into `employee`values(208,"xiaohei",'2000-12-19',"M",35000,3,206);
insert into `employee` values(209,"xiaobai",'1997-01-22',"F",39000,3,207);
insert into `employee` values(210,"xiaolan",'1925-11-10',"F",84000,1,207);
select * from `employee`;
#UPDATE `foreign key test`.`employee` SET `sup_id` = '207' WHERE (`emp_id` = '209');

insert into `client` values(400,"agou",25435335);
insert into `client` values(401,"amao",256399);
insert into `client` values(402,"wanglai",45354345);
insert into `client` values(403,"luxi",54354365);
insert into `client` values(404,"airuike",18783783);
select * from `client`;

insert into `works_with` values(206,400,70000);
insert into `works_with` values(207,401,24000);
insert into `works_with` values(208,402,9800);
insert into `works_with` values(209,403,24000);
insert into `works_with` values(210,404,87940);
select * from `employee`;
select *from `branch`;
select * from `works_with`;
UPDATE `foreign key test`.`employee` SET `salary` = '50000.0' WHERE (`emp_id` = '206');
select * from `employee` order by `salary` desc limit 3;
select `name` from `employee` ;
select distinct `sex` from `employee`;
#使用聚合函数
#员工人数
select count(*) from `employee`;
#生于1970-1-1后的女性
select count(*) from `employee` where `birth_date`>1970-01-01 and `sex`="F"; 
#平均薪水
select avg(`salary`) from `employee`;
#薪水综合
select sum(`salary`) from `employee`;
#最高最低
select max(`salary`) from `employee`;#min
#wildcard 万用字元   %   _
#取得电话号码是335的客户   姓ai的  生日在12月的
select * from `client` where `phone` like "%335";#kaitou  XXXX%   前后都用也行
select * from `client` where `client_name` like "ai%";
select * from `employee` where `birth_date` like '_____12%' ;
#union 联集alter
#员工的名字union客户名字
select `name` from `employee` union select `client_name` from `client`;#属性数目要一样，不能二合并一，资料形态要一致
#员工id+名字  union 客户id名字
select`emp_id`,`name` from `employee` union select `client_id`,`client_name` from `client`;#you can use as `total id` after `emp_id` to change the index
#join 连接
insert into `branch` values(4,"toula",null); 
#取得经理名字
select `emp_id`,`name`,`branch_name` from `employee` join `branch` on `emp_id`=`manager_id`;#如果有重复属性，可以指明表格`employee`.`emp_id`
select `emp_id`,`name`,`branch_name` from `employee` left join `branch` on `emp_id`=`manager_id`; #left 表示左边全部回传不管是否和右边对应， right joint 一样
#subquery 子查询
#找出研发部门经理名字 找出单一客户销售金额高于五万
select `name` from `employee` where `emp_id` =(select `manager_id` from `branch` where `branch_name`="keyan"); 
select `name` from `employee` where `emp_id` in (select `emp_id` from `works_with` where `total_sales` > 50000);
#删掉有关
delete from `employee` where `emp_id`=207;
select * from `branch`;
select * from `works_with`;#primary key not be 'set null'

