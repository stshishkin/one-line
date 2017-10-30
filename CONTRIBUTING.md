
# Contribution Guidelines

- [Forking the project](#forking-the-project)
- [Clonning your fork](#clonning-your-fork)
- [Make changes](#make-changes)
- [Update your repo](#update-your-repo)
- [Create a pull request](#create-a-pull-request)

#### Forking the project

1. Go to the top level repository: <https://github.com/stshishkin/one-line>
2. Click the "Fork" Button in the upper right hand corner of the interface ([More Details Here](https://help.github.com/articles/fork-a-repo/))
3. After the repository has been forked, you will be taken to your copy of the repo at `yourUsername/one-line`

#### Cloning Your Fork

1. Open a Terminal / Command Line / Bash Shell in your projects directory (_i.e.: `/yourprojectdirectory/`_)
2. Clone your fork of this repo

```shell
$ git clone https://github.com/yourUsername/one-line.git
```

##### (make sure to replace `yourUsername` with your GitHub Username)

This will download the entire repo to your projects directory.

#### Make changes

Add your favorite or the most useful one line script in following files:

- `db.sh` - file for database tips and tricks
- `find.sh` - file for tips and tricks with **find**-command
- `net.sh` - file for helpful network routines
- `stuff.sh` - file for smth funny stuff or not suitable for another files 

#### Update your repo

Commit changes with a meaningful commit message like "Added script for calculating free space".
```shell
$git add -A
$git commit -m "Commit message here"` (include double quotes)
```

#### Create a pull request 

1. Go to the pull requests tab of repository: <https://github.com/stshishkin/one-line/pulls>
2. Click the "New pull request" Button in the upper right hand corner of the interface ([More Details Here](https://help.github.com/articles/about-pull-requests/))
