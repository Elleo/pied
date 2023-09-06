all:
	cp -r ../build .
	flatpak-builder --force-clean build-dir com.mikeasoft.pied.yaml --repo=repo
	flatpak build-bundle repo com.mikeasoft.pied.flatpak com.mikeasoft.pied

