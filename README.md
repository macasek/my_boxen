# My Boxen

This is my fork of: https://github.com/boxen/our-boxen

## Getting Started

To give you a brief overview, we're going to:

* Install dependencies (basically Xcode)
* Bootstrap a boxen for your self/team/org/company
* Then convert your local copy of that boxen to the post-bootstrapped version

There are a few potential conflicts to keep in mind.
Boxen does its best not to get in the way of a dirty system,
but you should check into the following before attempting to install your
boxen on any machine (we do some checks before every Boxen run to try
and detect most of these and tell you anyway):

* Boxen __requires__ at least the Xcode Command Line Tools installed.
* Boxen __will not__ work with an existing rvm install.
* Boxen __may not__ play nice with a GitHub username that includes dash(-)
* Boxen __may not__ play nice with an existing rbenv install.
* Boxen __may not__ play nice with an existing chruby install.
* Boxen __may not__ play nice with an existing homebrew install.
* Boxen __may not__ play nice with an existing nvm install.
* Boxen __recommends__ installing the full Xcode.

### Dependencies

**Install the Xcode Command Lines Tools and/or full Xcode.**
This will grant you the most predictable behavior in building apps like
MacVim.

How do you do it?

* Install Xcode from the Mac App Store.
* OSX <= 10.8
  * Open Xcode.
  * Open the Preferences window (`Cmd-,`).
  * Go to the Downloads tab.
  * Install the Command Line Tools.
* OSX 10.9
  * xcode-select --install


### Setup

Make sure you hostname is properly set (assuming your config uses it)

```
scutil --get LocalHostName
scutil --get ComputerName
scutil --get HostName

scutil --set LocalHostName <hostname>
scutil --set ComputerName <hostname>
scutil --set HostName <hostname>
```

Pull down the boxen repo

```
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone git@github.com:macasek/my_boxen.git /opt/boxen/repo
cd /opt/boxen/repo
script/boxen
```

Keep in mind this requires you to encrypt your hard drive by default.
If you do not want to do encrypt your hard drive, you can use the `--no-fde`.

```
script/boxen --no-fde
```

It should run successfully, and should tell you to source a shell script
in your environment.
For users without a bash or zsh config or a `~/.profile` file,
Boxen will create a shim for you that will work correctly.
If you do have a `~/.bashrc` or `~/.zshrc`, your shell will not use
`~/.profile` so you'll need to add a line like so at _the end of your config_:

``` sh
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
```

Once your shell is ready, open a new tab/window in your Terminal
and you should be able to successfully run `boxen --env`.
If that runs cleanly, you're in good shape.

### TODO

This section contains setup that needs to be added. For now it must be done manually.

* Textmate
  * Install bundle to auto save https://github.com/bomberstudios/Save-On-Focus-Lost.tmbundle
  * setup striping of trailing whitespace on save
    * Open the bundle editor (⌃⌥⌘B)
    * “Text” → “Menu Actions” → “Converting / Stripping” → “Remove Trailing Spaces in Document / Selection”
    * Then in the drawer put callback.document.export in Semantic Class and Document / Replace Document as Input / Output.
* background
* screensaver
* dock
  * minimize windows into dock
* energy saver
* mouse
  * tracking speed
* track pad
  * tap to click
* user
  * add apple id
  * login - require username
	 * guest - disable
  * master password
* store
	 * auto download apps purchased on there computers
	 * install updates
* keychain
	 * show on menu
* add to dock
	 * apps
	 * docs
	 * change to show folder icon
* enable root user
* mission control
  * do not auto rearrange spaces
  * disable displays have separate spaces
* messages
  * set conn to be foe gmail
  * set to open on startup
* parallels
