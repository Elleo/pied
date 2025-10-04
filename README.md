# Pied
<p>
<img alt="A happy little pied wagtail" src="https://github.com/Elleo/pied/blob/main/assets/icon.png?raw=true" width=128 height=auto align="right" />
<br /><br />

Pied makes it simple to install and manage text-to-speech <a href="https://github.com/rhasspy/piper">Piper</a> voices for use with <a href="https://freebsoft.org/speechd">Speech Dispatcher</a>. Pied installs and configures the Piper neural text-to-speech engine to work with Speech Dispatcher. It can then be used to download and manage different voices.

<img alt="A screenshot showing the voice selection page in Pied" src="https://github.com/Elleo/pied/blob/main/screenshots/screenshot.png?raw=true" width=400 height=auto />

<a href="https://snapcraft.io/pied"><img alt="Get it from the Snap Store" src="https://snapcraft.io/static/images/badges/en/snap-store-black.svg" /></a> <a href="https://github.com/Elleo/pied/releases/download/v0.3.1/com.mikeasoft.pied.flatpak"><img alt="Install Flatpak" src="https://pied.mikeasoft.com/images/install_flatpak.svg" style='height: 56px; width: auto; margin-left: 1em;' /></a>

</p>

## Build Instructions

1. Install the [Flutter SDK](https://docs.flutter.dev/install)
2. Change to the Pied directory
3. Fetch dependencies: `flutter pub get`
4. Build: `flutter build linux --release` (Or without `--release` if you want a debug build)

You'll then find the compiled output in `build/linux/<arch>/release/bundle/`
