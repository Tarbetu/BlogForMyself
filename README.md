# Blog For Myself

I needed a blog site for me. There were some opportunities like WordPress, Jeykll. I hate WordPress because every good thing is expensive and I only have some Turkish Liras. (Yeah, thanks to a noble economist Recai Tayyar Ersilivri, Turkish Lira is a ~~fallen~~ rising angel.) Also, I don't want to learn and code PHP only for WordPress.

Static site generators like Jeykll are really beautiful but I think that they are missing something. I can't feel satisfied when I think about I will need some expansions.

So I wrote this blog for myself. I just want to practice and I just want to experience the aesthetics of Ruby and Rails. (<3)

See? Even Psychology students can develop web projects, you don't need to hire anyone who graduated from computer engineering or related fields for projects like this. 

# Which technologies are used?

Rails for Backend, Postgresql for database, Stimulus and Turbo for Frontend.

# How to setup?

There is [https://github.com/mina-deploy/mina](Mina) in the Gemfile. You just need to prepare a "config/deploy.rb" if you will use Mina. (I won't share mine) You can use Capistrano or other deploying tools. Just use what do you want. Install PostgreSQL on the deploying target and use a web server.
