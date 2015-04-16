set :stage, :production

# Simple Role Syntax
# ==================
#role :app, %w{deploy@example.com}
#role :web, %w{deploy@example.com}
#role :db,  %w{deploy@example.com}
role :app, %w{ubuntu@ec2-52-5-168-163.compute-1.amazonaws.com}
role :web, %w{ubuntu@ec2-52-5-168-163.compute-1.amazonaws.com}
role :db, %w{ubuntu@ec2-52-5-168-163.compute-1.amazonaws.com}

# Extended Server Syntax
# ======================
server 'ec2-52-5-168-163.compute-1.amazonaws.com', user: 'ubuntu', roles: %w{web app db}

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally

set :ssh_options, {
    keys: ["#{ENV['USERPROFILE']}/.ssh/faprender-edx-aws.key"],
    forward_agent: false,
}

fetch(:default_env).merge!(wp_env: :production)

