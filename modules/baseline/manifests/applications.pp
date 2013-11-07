class baseline::applications {
  include go

  # Apps
  include charles
  include chrome
  include dropbox
  include firefox
  include gimp
  include gitx
  include iterm2::stable
  include onyx
  include mou
  include mou::themes
  include mysql
  include redis
  include sublime_text_2
  include slate
  include textmate::textmate2::nightly

  # Utils
  include foreman
  include freetds
  include gcc
  include gh
  include homebrew
  include imagemagick
  include licecap
  include moreutils
  include phantomjs
  include pow
  include openssl
  include screen
  include sysctl
  include wget
}