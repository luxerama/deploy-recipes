# Deploy::Recipes

This Gem provides deployment helpers and task used by [The Beans Group][1].

## Installation

Add this line to your application's Gemfile:

    gem 'deploy-recipes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deploy-recipes

## Usage
Some tasks and helpers require extra configuration. At the moment the only way of providing the extra configuration options is to set those in the `deploy.rb` sript.  
The way of setting them is as follows:

	set :option_name, option_value

## Capistrano Helper Usage
This Gem contains some helpers that can be used with capistrano. Helpers generally need to be loaded at the top of the `deploy.rb` script, if not otherwise stated.

## SCM
Unfortunately I have yet to find an easy way of defaulting capistrano to git. This means that both `scm` and `repository` have to be set in the deploy.rb file.

### AWS EC2
The AWS EC2 task is used to dynamically set the web, app and db server valiables in your deploy.rb file.
For this helper to work properly you need to set the following vaiables in your `deploy.rb` file:

* `access_key_id` (required)      - Your AWS access key id
* `secret_access_key` (required) - You AWS secret access key

## Capistrano Tasks Usage
This section describes the tasks made available by this Gem. Tasks are generally (if not otherwise stated) loaded at the end of the `deploy.rb` script.

### Database
This task can be used to generate the database configuration file for a project. During the execution of this taks it will ask you to enter the password of the database.   
This tasks will be executed once required in the `deploy.rb` file. For more information when this task will be run please look towards the end of this taks.

### Deploy Automation
The deploy automation task can be used with Pivotal Tracker and Git to make deployment and managing deploys easier.
For this task to work properly you need to set the following vaiables in your `deploy.rb` file:

* `pivotal_tracker_token` (required) - This is the API token needed to interact with your PT account
* `changelog_location` (optional)    - Define the location at which you would like the changelog to be stored. At the moment this has to be within
the scope of the Git repository because this task expects to be able to commit the changelog and push it to the remote branch.

This tasks will be executed after the `deploy:cleanup` task, once required in the `deploy.rb` file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[1]: http://www.thebeansgroup.com "The Beans Group"
