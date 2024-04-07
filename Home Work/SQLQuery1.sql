Create DataBase CourseAppDatabase
use CourseAppDatabase

create table Students (
[id] int primary key identity(1,1),
[FullName] nvarchar(259),
[adress] nvarchar(255),
[Email] nvarchar(255),
[Age] int,
[CityId] int,
foreign key([CityId])  references City(id)
)

create table City (
[id] integer primary key identity(1,1),
[name] nvarchar(250),
[CountryId] int,
foreign key([CountryId])  references Country(id)
)

create table Country(
[id] integer primary key identity(1,1),
[name] nvarchar(250)
)

create table Groups(
[id] int primary key identity(1,1),
[Name] nvarchar(250),
[Capacity] int,
[RoomId] int,
[EducationId] int
foreign key([RoomId]) references Rooms(id),
foreign key([EducationId]) references Educations(id)
)

create table StudentGroups(
[id] int primary key identity(1,1),
[GroupId] int,
[StudentId] int,
foreign key([GroupId]) references Groups(id),
foreign key([StudentId]) references Students(id)
)

create table Educations(
[id] int primary key identity(1,1),
[name] nvarchar (250)
)


create table Rooms(
[id] int primary key identity(1,1),
[name] nvarchar (250)
)



ALTER TABLE Rooms
ADD capacity INT;

create table TeacherGroups(
[id] int primary key identity(1,1),
[TeacherId] int,
[GroupsId] int,
foreign key([TeacherId]) references Teachers(id),
foreign key([GroupsId]) references Groups(id)
)


create table Teachers(
[id] int primary key identity(1,1),
[Fullname] nvarchar (250),
[Salary] float,
[Adress] nvarchar,
[Email] nvarchar
)

create table StaffMembers(
[id] int primary key identity(1,1),
[Fullname] nvarchar (250),
[Salary] float,
[Age] int,
[CityId] int
)

create table RoleStaffMembers(
[id] int primary key identity(1,1),
[RoleId] int,
[StaffMembersId] int,
foreign key([RoleId]) references Roles(id),
foreign key([StaffMembersId]) references StaffMembers(id)
)

create table Roles(
[id] int primary key identity(1,1),
[Name] nvarchar (250),
[Departmentid] int,
foreign key([Departmentid]) references Departments(id)
)

create table departments(
[id] int primary key identity(1,1),
[name] nvarchar (250)
)


insert into Country([name])
Values ('Azerbaijan'),
       ('Turkey') ,      
	   ('Japan'),
       ('Russia')



insert into City([name],[CountryId])
Values ('Baki',1),
       ('Istanbul',2) ,      
	   ('Tokyo',3),
       ('Moscow',4)

insert into Students([FullName],[adress],[Email],[Age])
Values ('Behruz Eliyev','Yasamal','Behruz@gmail.com',18),
       ('Hcixan Hacixanov','28 MAy','Hcixanz@gmail.com',20),
       ('Ilsgar shriev','Nerimanov','Ilsgar@gmail.com',46),
       ('Nurlan Umudov','kurdexani','Nurlanz@gmail.com',99)

     
		
UPDATE Students
set adress = 'Darband' 
where id =2;

UPDATE Students
set adress = 'Silivri'
where id = 2;

UPDATE Students
set adress = ' Kita'
where id = 1;



insert into Teachers([Fullname],[Salary],[Adress],[Email], [id])
values ('esger Hacixanov', '2500', '28 May','esger@gmail.com',22),
       ('Hacixan esgerov','250.5','28 May','Hcixanz@gmail.com',20)


ALTER TABLE Teachers
ALTER COLUMN [Adress] nVARCHAR(255);

insert into StaffMembers([Fullname],[Salary], [Age],[CityId])
values('Salahaddin Shahbazov', '1000',18,1),
('Nikhad Bayramov',990,23,1)

insert into Educations([name])
values('Beatmaking'),('Software Development'),('Audio Engineer'), ('English')


insert into Rooms([name],[capacity])
values('Saturn', 20),('Mars', 12),('Venus', 13),('Jupiter', 17),('Uran', 20)


insert into Groups([name],[Capacity],[RoomId],[EducationId])
values('P236', 20,1,1),('P235', 12,2,2),('PB101', 13,3,3),('P233', 17,4,4),('P230', 20,3,1)


insert into departments([name])
values('IT department'),('Human Resources department'),('Artists & Repertoire department'),('Finance Department
'),('law department')



insert into Roles([name],[Departmentid])
values('IT developer',1),('HR Specialst',2),('A&R Manager', 3),('Financal staff',4),('lawyer',5)

select * from Roles