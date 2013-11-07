class config::sublime {
  define addpkg {
    $packagedir = "/Library/Application Support/Sublime Text 2/Packages/"
    $pkgarray = split($name, '[/]')
    $pkgname = $pkgarray[1]

    exec { "git clone https://github.com/${name}.git":
      cwd      => "/Users/${::luser}${packagedir}",
      provider => 'shell',
      creates  => "/Users/${::luser}${packagedir}${pkgname}",
      path     => "${::boxen::config::homebrewdir}/bin",
      require  => [Package['SublimeText2'], Package['boxen/brews/git']],
    }
  }

  $base = "/Users/${::luser}/Library/Application Support"
  $installedPackagesDir = "${base}/Sublime Text 2/Installed Packages"
  $structure = [ "${base}/Sublime Text 2",
                 "${base}/Sublime Text 2/Settings",
                 "${base}/Sublime Text 2/Packages",
                 "${base}/Sublime Text 2/Packages/User",
                 "${$installedPackagesDir}"
               ]

  file { $structure:
    ensure  => 'directory',
    owner   => "${::luser}",
    mode    => '0755',
  }->

  file { "${boxen::config::bindir}/lime":
    ensure  => link,
    target  => '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl',
    mode    => '0755',
    require => Package['SublimeText2'],
  }

  $packageControlLink = "https://sublime.wbond.net/Package%20Control.sublime-package"
  exec { "curl -o 'Package Control.sublime-package' ${packageControlLink}":
    cwd      => "${installedPackagesDir}",
    provider => 'shell',
    creates  => "${installedPackagesDir}/Package Control.sublime-package",
    path     => "/usr/bin",
    require  => [Package['SublimeText2'], File[$installedPackagesDir]],
  }

  file { "${base}/Sublime Text 2/Packages/User/Default (OSX).sublime-keymap":
    source  => "puppet:///modules/baseline/sublime/Default (OSX).sublime-keymap",
    require => Package['SublimeText2'],
  }

  file { "${base}/Sublime Text 2/Packages/User/Preferences.sublime-settings":
    source  => "puppet:///modules/baseline/sublime/Preferences.sublime-settings",
    require => Package['SublimeText2'],
  }

  addpkg { [
    "revolunet/sublimetext-markdown-preview",
    "eklein/sublime-text-puppet",
    "kemayo/sublime-text-2-git",
    "dzhibas/SublimePrettyJson",
    "mrmartineau/HTML5",
    "wbond/sublime_alignment",
    "LewisW/SublimeAutoSemiColon",
    "facelessuser/ApplySyntax",
    "mattbanks/dotfiles-syntax-highlighting-st2",
    "DisposaBoy/GoSublime",
    "n00ge/sublime-text-haml-sass",
    "SublimeText/jQuery",
    "titoBouzout/SideBarEnhancements",
    "kvs/ST2Slate",
    "SublimeCodeIntel/SublimeCodeIntel",
    "SublimeLinter/SublimeLinter",
    "pavelpachkovskij/sublime-html-to-haml"
    ]:
  }
}
