# L-ink

L-ink platform for teachers to connect class in the world

## Quick start

* Run `bundle install`
* Run `rake db:migrate`

Then run your server
<pre>
rails s -b 0.0.0.0
</pre>

Check at [http://localhost:3000](http://localhost:3000)

## Requirements

* Rails 4.2
* Ruby 2.2.0
* Imagemagick (For uploading pictures)
* Vagrant (Optional)
* PostgreSQL 9.3

#### Vagrant
---
L-ink has a *Vagrant* file to create your own Virtual Machine for development.

To get started you need to have [Vagrant](http://www.vagrantup.com) and [Virtal Box](https://www.virtualbox.org/) instaled.

After that you just need to start your VM:
<pre>vagrant up</pre>

Log into the virtual machine
<pre>vagrant ssh</pre>

#Configure database
<pre> sudo su - postgres </pre>
<pre> psql </pre>
<pre> ALTER USER postgres with encrypted password 'Pa$$w0rd'; </pre>
<pre> CREATE DATABASE link_development WITH OWNER postgres; </pre>
<pre> GRANT ALL PRIVILEGES ON DATABASE link_development TO postgres; </pre>


## See links for more details
## http://stackoverflow.com/questions/1471571/how-to-configure-postgresql-for-the-first-time

Exec pending migration
<pre>rake db:migrate</pre>
<pre>ras<pre>
And its done !
