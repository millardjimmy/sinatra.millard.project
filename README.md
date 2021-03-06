
### Police Behavior Tracker
Law enforcement agencies across the country have failed to provide us with even basic information about the lives they have taken. 
<br>
<br>
And while the Death in Custody Reporting Act mandates this data be reported, its unclear whether police departments will actually comply with this mandate and, even if they do decide to report this information, it could be several years before the data is fully collected, compiled and made public. 
<br>
<br>
This acts as a way to access information users have added to the database.

### Project Requirements
<ol>
<li>Build an MVC Sinatra application.</li>
<li>Use ActiveRecord with Sinatra.</li>
<li>Use multiple models.</li>
<li>Use at least one has_many relationship on a User model and one belongs_to relationship on another model.</li>
<li>Must have user accounts - users must be able to sign up, sign in, and sign out.</li>
<li>Validate uniqueness of user login attribute (username or email).</li>
<li>Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.</li>
<li>Ensure that users can edit and delete only their own resources - not resources created by other users.</li>
<li>Validate user input so bad data cannot be persisted to the database.</li>

</ol>

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Clone and run the following command inside this project's directory 

    $ bundle

### Development

Run the following command to load database schema

    $ bundle exec rake db:schema:load

Start up local server

    $ bundle exec shotgun or $ bundle exec rackup

For interactive console

    $ bundle exec rake console

## Built With

* [Ruby 2.6.1](https://www.ruby-lang.org/en/news/2019/01/30/ruby-2-6-1-released/)
* [Sinatra](http://sinatrarb.com/) - The web framework used
* [Bundler](https://bundler.io/) - Dependency Management

## Versioning

Thie repository uses [SemVer](http://semver.org/) for versioning.

## Author

* **Millard** - *Initial work* - [Github](https://github.com/millardjimmy)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details