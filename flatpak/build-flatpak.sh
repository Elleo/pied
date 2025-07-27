set -e
set -x

tar -zxf pied-0.3.1-x86_64.tar.gz

mkdir -p /app/pied
cp -r pied/* /app/pied/

mkdir -p /app/bin
ln -s /app/pied/pied /app/bin/pied
cp killall /app/bin/

mkdir -p /app/share/icons/hicolor/256x256/apps/
cp -r com.mikeasoft.pied.png /app/share/icons/hicolor/256x256/apps/

mkdir -p /app/share/applications
cp -r com.mikeasoft.pied.desktop /app/share/applications/

mkdir -p /app/share/metainfo
cp -r com.mikeasoft.pied.metainfo.xml /app/share/metainfo/

