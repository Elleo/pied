set -e
set -x

ls

mkdir -p /app/pied
cp -r linux/x64/release/bundle/* /app/pied/

mkdir -p /app/bin
ln -s /app/pied/pied /app/bin/pied
cp killall /app/bin/
cp spd-say /app/bin/

mkdir -p /app/share/icons/
cp -r com.mikeasoft.pied.png /app/share/icons/

mkdir -p /app/share/applications
cp -r com.mikeasoft.pied.desktop /app/share/applications/

mkdir -p /app/share/metainfo
cp -r com.mikeasoft.pied.metainfo.xml /app/share/metainfo/
