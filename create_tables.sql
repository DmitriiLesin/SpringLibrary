create database SpringLibrary
;
create table Person
(
    person_id     int generated by default as identity primary key,
    full_name     varchar(256) not null,
    year_of_birth int          not null check ( year_of_birth >= 1900 )

)
;
create table Book
(
    book_id       int generated by default as identity primary key,
    title         varchar(256) not null,
    author        varchar(256) not null,
    year_of_issue int          not null check ( year_of_issue >= 1900 ),
    person_id     int          references springlibrary.public.person (person_id) on delete set null
)
;
create unique index on Person (full_name)
;
create index on Book (person_id)
;