class config::ruby {
  ruby::gem { "bundler for 2.0.0":
    gem     => 'bundler',
    ruby    => '2.0.0'
  }

  ruby::gem { "dotenv for 2.0.0":
    gem     => 'dotenv',
    ruby    => '2.0.0'
  }

  ruby::gem { "bundler for 1.9.3":
    gem     => 'bundler',
    ruby    => '1.9.3'
  }

  ruby::gem { "dotenv for 1.9.3":
    gem     => 'dotenv',
    ruby    => '1.9.3'
  }

  ruby::plugin { 'rbenv-vars':
    ensure => 'v1.2.0',
    source  => 'sstephenson/rbenv-vars'
  }

  ruby::plugin { 'rbenv-gemset':
    ensure => 'v0.4.1',
    source  => 'jf/rbenv-gemset'
  }

  ruby::plugin { 'rbenv-use':
    ensure => 'master',
    source  => 'rkh/rbenv-use'
  }

  ruby::plugin { 'rbenv-update':
    ensure => 'master',
    source  => 'rkh/rbenv-update'
  }

  ruby::plugin { 'rbenv-aliases':
    ensure => 'master',
    source  => 'tpope/rbenv-aliases'
  }
}