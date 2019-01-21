DROP TABLE bookings;
DROP TABLE members;
DROP TABLE sessions;


CREATE TABLE sessions (
  id serial8 primary key,
  session_name varchar(255),
  type varchar(255),
  start_time TIMESTAMP
);

CREATE TABLE members (
  id serial8 primary key,
  first_name varchar(255),
  last_name varchar(255),
  gender varchar(255),
   age INT4
);

CREATE TABLE bookings (
  id SERIAL8 primary key,
  member_id INT8 references members(id),
  session_id INT8 references sessions(id)
);
