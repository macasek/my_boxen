class people::macasek {
  include baseline::environment

  include people::macasek::config
  include people::macasek::dotfiles
  include people::macasek::applications
}