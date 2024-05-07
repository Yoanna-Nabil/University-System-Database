create database "University";

drop table Student;

create table Student (StudentId int primary key,
Surname varchar(20) not null,
Birthdate date default (getdate()),
Yearenrolle int not null,
pID int not null);

drop table Program;
create table Program (ProgramId int primary key,
Yearcommanced int not null,
Creditpoint int not null,
Name varchar(20) not null);

drop table Course;
create table Course (CourseId int primary key,
Yearcommanced int not null,
Creditpoint int not null,
Name varchar(20) not null,
Semester varchar(50) not null,
[Year] int not null,
ProgramID int not null,
 FOREIGN KEY (ProgramID) REFERENCES Program (ProgramId));

 drop table StudentName;
 create table StudentName (SID int not null,
    FOREIGN KEY (SID) REFERENCES Student(StudentId),
	name varchar(20) not null,
	 constraint  PK_Student PRIMARY KEY (SID, name)
);

drop table  Student_Course;
   create table  Student_Course (SID int not null,
     FOREIGN KEY (SID) REFERENCES Student(StudentId),
	 CID int not null,
	 Semester varchar(50) not null,
	 [Year] int not null,
	 grade  varchar(20) not null,
	  mark int not null,
	 FOREIGN KEY (CID) REFERENCES Course(CourseId),
	 constraint PK_Course PRIMARY KEY (CID, SID)
);

 ALTER TABLE Student
ADD FOREIGN KEY (pID) REFERENCES  Program(ProgramId);




insert into   Program
( ProgramId, Yearcommanced ,Creditpoint, Name )
values(1, 2017, 1000, 'UI and Web '),
(2, 2018, 8000, 'Open Source'),
(3, 2019, 9000, 'Social Media'),
(4, 2020, 2000, 'Profesional Web'),
(5, 2021, 10000, 'Graphic Design');

insert into  Student
( StudentId ,Surname ,Birthdate ,Yearenrolle,pID )
values(1, 'shaban', '2001-06-01', 2017, 1),
(2, 'Ali', '2000-07-01', 2018, 2),
(3, 'Ahmed', '2001-04-01', 2017, 3),
(4, 'omran','2000-09-01', 2018, 4),
(5, 'mohamed', '2001-03-01', 2017, 5);

insert into   Course
( CourseId, ProgramID , Yearcommanced ,Creditpoint, Name,[Year],Semester )
values(201,1,2017, 1000, 'JavaScript', 1 ,'semester 1'),
(476,2, 2018, 8000, 'node.js', 2 ,'semester 3'),
(457,3, 2019, 9000, 'marketing',1,'semester 1'),
(654,4, 2020, 2000, 'ASP.Net',3,'semester 5'),
(567,5, 2021, 10000, 'Photoshop',4,'semester 7');

insert into   StudentName
(SID,name)
Values(1,'yoanna_Nabil'),
(1,'dina-wahed'),
(2,'shadwa_osama'),
(3,'demiana_bahjat'),
(4,'kholoud_hanafy'),
(5,'jaklen_magdy');


insert into Student_Course
( SID, CID , Year ,Semester, grade,mark )
values( 1, 201 , 1 ,'semester 1' ,'A+',100 ),
( 2, 476 , 2 ,'semester 2','c+',80 ),
( 3, 457 ,1,'semester 1' ,'B',85 ),
( 4, 654 ,3,'semester 3','B+',90 ),
( 5, 567 , 4,'semester 3','A+',100 );


delete from StudentName
where SID=5
delete from Student_Course 
where  CID=567
delete from Student
where Surname='mohamed'
delete from Course
where ProgramID=5
delete from Program
where Yearcommanced=2021



select *   from Student 
select *   from Student_Course
select *  from  Program
select *  from  Course
select *   from StudentName

select Semester, count(*) as StudentsCount 
from Student_Course 
group by Semester;

select Program.Name as ProgramName, Course.Name as CourseName 
from Program 
inner join Course ON Program.ProgramId = Course.ProgramID

select *   from Student
where StudentId between 2 and 4

select SID,name from StudentName 
union
select  ProgramId,Name from Program

select * from  Student 
where StudentId in (1,2,3)

select Surname from Student
where StudentId =1 or StudentId = 2 or StudentId = 4

select name from Course
select name from StudentName 
where SID=1



select grade 
from Student_Course
where mark<=100

 
update Student
set Surname= 'khaled'
where StudentId =4


select distinct Yearenrolle from Student 

select Surname from Student 
where Surname like 'A%'

select Surname , StudentId from Student 
order by Yearenrolle , pID


select   Semester+ ' '+ grade as sucess from Student_Course 

select  max(Creditpoint ), Semester  
from Course
where Year =1
group by Semester 

select c.Name, sc.grade
from Course C inner join Student_Course sc
on sc.CID = c.CourseId


select *
from Student
where StudentId >=
(select StudentId
from Student
where pID = 3)



