class config::osx {
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog

  include osx::dock::clear_dock

  include osx::finder::unhide_library

  include osx::disable_app_quarantine
  include osx::no_network_dsstores
}
