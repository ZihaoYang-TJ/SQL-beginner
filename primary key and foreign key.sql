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
foreign key (`manager_id`) references `employee`(`emp_id`) on delete set null
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
foreign key(`emp_id`) references `employee`(`emp_id`) on delete cascade,
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