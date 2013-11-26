class config::phantomjs {
  # phantomjs::version { '1.9.0': }

  class { 'phantomjs::global':
    version => '1.9.0'
  }
}

