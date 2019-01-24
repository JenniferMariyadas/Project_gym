# Project_gym
This is my first project at CodeClan. I was asked to build a piece of software to help the gym manage members, add sessions and 
register members onto gym sessions. 

## Getting started 

You cna have the project running in your system by pulling the files to your local computer 

```
Createdb gym
```
When this has been created, run the following on the command line:

```
psql -d gym -f db/gym.sql
````

You should now have a database set up with the required columns. You can run the seeds document to populate the database to view the data

```
ruby db/seeds.rb
```
From there, run the controller.rb file to load a Sinatra server and input the link in your browser, localhost:4567

```
ruby gym_controller.rb -> web browser -> localhost:4567
```

### Prerequisites

A number of ruby gems are required to run the files included. Minitest, PG, Sinatra, Pry and Sinatra Reloader have all been used in development of the app.

```
Minitest - https://rubygems.org/gems/minitest/versions/5.8.4
PG - https://rubygems.org/gems/pg/versions/0.18.4
Sinatra - https://github.com/sinatra/sinatra
Pry - https://github.com/pry/pry
Sinatra Reloader - http://sinatrarb.com/contrib/reloader
```

## Running the tests 

getters are tested with the model/specs file and can run on the command line if the Minitest is installed.

```
ruby specs/test_file(own test file).rb
```

## Built With
```
[Ruby] http://ruby-doc.com/ - A dynamic, interpreted, reflective, object-oriented, general-purpose programming language.
[Sinatra] http://sinatrarb.com/ - Web framework
[atom] https://atom.io/ - Code editor
[PostgreSQL] https://www.postgresql.org/ - Open source object-relational database management system.
[Postico] https://eggerapps.at/postico/ - A Modern PostgreSQL Client for the Mac
[draw.io] https://www.draw.io/ There are two .xml files in the 'misc' folder. These are diagrams which can be opened @ draw.io and show my initial class and database modelling process.
```
## Contributing
Suggestions are welcome and the work can be downloaded for future purpose. 

## Authors
The work was mostly completed by myself, https://github.com/JenniferMariyadas

### Ackowledgements

Most of the work was completed by myself with immense help from my CodeClan teacher, Keith Doughlas and Colin Farquar.
Thanks to my CodeClan SW1 classmates. 




