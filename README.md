# Michigan Hackers Website
Blah Balah Blah we have a website.

## Getting Started with RVM, Ruby, and Rails
Start by installing RVM. Be sure to pay attention to the difference between the
single-user install, and the multi-user install. Also, be super sure not to
install RVM when logged in as root. 

TL;DR - [Install RVM, and be sure to read their docs](https://rvm.io/rvm/install/#explained)

## Installing the correct version of Ruby
We're using ruby version ruby-1.9.3-p194, as dicated by the RVM installer. Thus,
use this command when doing your initial install.

    rvm install ruby-1.9.3-p194

## Installing Ruby on Rails
Surprise! You don't actually have to install Ruby on Rails. RVM and bundler will
do this for you! After you have RVM and Ruby 1.9.3 all set up, start a new
terminal session and 'cd' into this repo. RVM should give you a warning about a
new shell script; confirm that you'd like to run the script (.rvmrc). You should
see the following items:

* Using $HOME/.rvm/gems/ruby-1.9.3-p194 with gemset michiganhackers
* $HOME/.rvm/gems/ruby-1.9.3-p194@michiganhackers/bin/bundle
* A bunch of "install" statements
* Your bundle is complete!

If any of the following are not present, or you see red text, then something is
wrong. In that case, please troubleshoot, and note the issue in this Readme, or
on any dedicated wiki. (Perhaps the Github wiki...?)

## Getting started and running the server
Yay! Now you're done. Let's get to it. If you have never used RoR before, reach
out to members of MH to get leads on good tutorials. In general though, the ROR
website, as well as RailsCasts, are both great starting points. Rails for
Zombies is also worth checking out. 

NB: You can run the server with the following command: 

    rails s

## Making Database Updates 
Be sure to read the Ruby on Rails guide for working with Database Migrations.
You can find it on there website, or follow [this link](http://guides.rubyonrails.org/migrations.html)

## Working with Static Assets (SASS)
If you didn't read all the way through the README, and are wondering why none of the assets are showing up, 
it's because you didn't read this part of the README! There is a script in the {ROOT}/script directory called
**manage_assets_development**. Run this. It will set up symlinks from app/assets to public/assets, as well as 
run the SASS compiler. 

The script is also a work in progress. For example, none of the confirmation dialogs actually give you a choice. 
If you're so inspired, you can help hash this out more fully.

## Contributors
* Max Seiden

## License
Copyright (c) 2012 Michigan Hackers 

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
