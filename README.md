[![Ruby](https://github.com/Samuel1698/PinkWug.live/actions/workflows/ruby.yml/badge.svg?branch=main)](https://github.com/Samuel1698/PinkWug.live/actions/workflows/ruby.yml)
[![CodeQL](https://github.com/Samuel1698/PinkWug.live/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/Samuel1698/PinkWug.live/actions/workflows/codeql-analysis.yml)
## Dependencies:
* [Imagemagick VIPS](https://github.com/janko/image_processing)

## To run this application you need
* Ruby 3.0.0
* Rails 6.0.3.7
* PostgreSQL

### Install Command Line Tools (MacOS)
1. Open Terminal
2. In the Terminal window, type the following and press **Return:**
```shell
xcode-select --install
```
3. Click **Install**


### Installing Homebrew (MacOS)
Homebrew is a command line tool that makes it easy to install software in Mac OS. Used here to install rbenv, Ruby, and Rails.
1. Go to [brew.sh](https://brew.sh/) and **copy** the command, it should look something like this:
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
2. **Paste** the command in the terminal and press **Return**
3. Once you follow the prompts, type:
```shell
brew doctor
```
If everything is working, the Terminal will print **Your system is ready to brew**



### Installing rbenv, Ruby, and Rails
Visit https://gorails.com/setup/ and follow the instructions for your operating system

Remember to input Ruby **3.0.0** when typing the command as istructed, and Rails **6.0.3.7**

### Installing Yarn
This is required for Rails version 6 to compile the frontend assets.
* **macOS**
  ```shell
  brew install yarn
  ```
* **Debian/Ubuntu**
  ```shell
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  ```
  Then
  ```shell
  sudo apt update && sudo apt install yarn
  ```
For further instructions on Linux, visit the [Yarn Installation Website](https://classic.yarnpkg.com/en/docs/install/#debian-stable)

### Installing PostgreSQL
* **macOS**
  1. To install postgres run the following command in the terminal. It will install the command line console (**psql**) as well as the local server
  ```shell
  brew install postgresql
  ```

  2. To start the service and log-in to it, run:
  ```shell
  brew services start postgresql
  ```

  3. If you wish to start the server automatically when you restart your computer, run:
  ```shell
  pg_ctl -D /usr/local/var/postgres start
  ```

* **Debian/Ubuntu**
  1. Update the package list
  ```shell
  sudo apt-get update
  ```

  2. Install PostgreSQL
  ```shell
  sudo apt-get install postgresql postgresql-contrib
  ```
  3. To start the server run:
  ```shell
  pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start
  ```

### Creating the Database
1. Go into the postgres command line
  ```shell
  psql postgres
  ```
2. Here we will need to create a new user. Substitude **username** and **password** for your own. Don't forget the **;** at the end.
```shell
CREATE ROLE <username> WITH LOGIN PASSWORD "<password>";
```

```shell
ALTER ROLE <username> CREATEDB;
```

3. Type **\du** to see your new user. Quit the postgres console with **\q**
4. Log-in as the new user to create the required databases. In the terminal, type:
```shell
psql postgres -U <username>
```
  Then
```shell
CREATE DATABASE pinkwug;

CREATE DATABASE pinkwug_test;
```

4. Type **\list** to see a list of databases. Exit the console with **\q**

### Cloning the repo
1. Open the terminal, and navigate to a folder without spaces on its name (webpacker won't work if it does) by typing **cd**, then dragging and dropping the folder into the console. It should copy the path.
2. Run the command:
```shell
git clone https://github.com/Samuel1698/PinkWug.live.git
```

3. Open the new folder
```shell
cd PinkWug.live
```


### Final Steps
1. While in the PinkWug.live folder, run these commands in the command line:
```ruby
bundle install

yarn upgrade

bundle exec rails webpacker:install

rails db:reset
```
2. You're now ready to start the server, in the command line, type:
```ruby
rails s
```

Navigate to http://localhost:3000/
