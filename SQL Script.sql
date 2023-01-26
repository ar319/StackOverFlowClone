create database StackOverflow


use StackOverflow


create table Categories(
CategoryID int primary key identity(1,1),
CategoryName nvarchar(max))

insert into categories values('Java');

create table Users(
UserID int primary key identity(1,1),
Email nvarchar(max),
PasswordHash nvarchar(max),
Name nvarchar(max),
Mobile nvarchar(max),
IsAdmin bit default(0))



create table Questions(
QuestionID int primary key identity(1,1),
QuestionName nvarchar(max),
QuestionDateAndTime datetime,
UserID int references Users(UserID) on delete cascade,
CategoryID int references Categories(CategoryID) on delete cascade,
VotesCount int,
AnswersCount int,
ViewsCount int)


create table Answers(
AnswerID int primary key identity(1,1),
AnswerText nvarchar(max),
AnswerDateAndTime datetime,
UserID int references Users(UserID),
QuestionID int references Questions(QuestionID) on delete cascade,
VotesCount int)


create table Votes(
VoteID int primary key identity(1,1),
UserID int references Users(UserID),
AnswerID int references Answers(AnswerID) on delete cascade,
VoteValue int)



insert into Users values('admin@gmail.com', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9',
'Admin', '0000000000', 1)
insert into Users values('test@gmail.com', '9572d7f4e812df12cd8c0d26e7308864c33cbb51b004cbe962ad545bc377a4a2',
'Test', '0000000000', 0)
go
insert into Categories values('HTML')
go
insert into Categories values('CSS')
go
insert into Categories values('JavaScript')
go
insert into Questions values('How to display in the browser titlebar using HTML','2018-8-2 10:03 am',2,1,0,0,0)
go

insert into Questions values('How to set background image in CSS','2018-8-5 1:15 am',2,2,0,0,0)
go


