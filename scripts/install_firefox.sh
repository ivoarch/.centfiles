#!/bin/bash
# Install any version of Firefox browser with your language pack (on Linux).
# Autor: Ivaylo Kuzev (@ivoarch) 2014

# Init
if [ ! $# -eq 2 ]; then
    echo "usage: sudo $0 version locale"
    echo "example: sudo $0 31.2.0esr bg"
    exit 1;
fi

version="$1"
locale="$2"

# Find the architecture
osarch="$(uname -m)"

# Main
echo "Downloading Firefox-$version-i18n-$locale..."
cd /usr/local/src
wget -c "https://ftp.mozilla.org/pub/firefox/releases/${version}/linux-${osarch}/${locale}/firefox-${version}.tar.bz2"
echo "Installing Firefox-$version-i18n-$locale..."
tar -xjvf firefox-"${version}".tar.bz2
rm -rf /opt/firefox 2>/dev/null
mv firefox /opt/firefox
rm /usr/bin/firefox 2>/dev/null
ln -sf /opt/firefox/firefox /usr/bin/firefox
mkdir -pv /usr/share/pixmaps
ln -sfv /opt/firefox/browser/icons/mozicon128.png \
        /usr/share/pixmaps/firefox.png
echo "Creating a .desktop file for Firefox browser"
mkdir -pv /usr/share/applications
rm /usr/share/applications/firefox.desktop 2>/dev/null
cat << 'EOF' > /usr/share/applications/firefox.desktop
[Desktop Entry]
Encoding=UTF-8
Name=Firefox
Name[bg]=Firefox
Name[ca]=Firefox
Name[cs]=Firefox
Name[el]=Firefox
Name[es]=Firefox
Name[fa]=Firefox
Name[fi]=Firefox
Name[fr]=Firefox
Name[hu]=Firefox
Name[it]=Firefox
Name[ja]=Firefox
Name[ko]=Firefox
Name[nb]=Firefox
Name[nl]=Firefox
Name[nn]=Firefox
Name[no]=Firefox
Name[pl]=Firefox
Name[pt]=Firefox
Name[pt_BR]=Firefox
Name[ru]=Firefox
Name[sk]=Firefox
Name[sv]=Firefox
Comment=Browse the World Wide Web
Comment[bg]=Сърфиране в Мрежата
Comment[ca]=Navegueu per el web
Comment[cs]=Prohlížení stránek World Wide Webu
Comment[de]=Im Internet surfen
Comment[el]=Περιηγηθείτε στον παγκόσμιο ιστό
Comment[es]=Navegue por la web
Comment[fa]=صفحات شبکه جهانی اینترنت را مرور نمایید
Comment[fi]=Selaa Internetin WWW-sivuja
Comment[fr]=Navigue sur Internet
Comment[hu]=A világháló böngészése
Comment[it]=Esplora il web
Comment[ja]=ウェブを閲覧します
Comment[ko]=웹을 돌아 다닙니다
Comment[nb]=Surf på nettet
Comment[nl]=Verken het internet
Comment[nn]=Surf på nettet
Comment[no]=Surf på nettet
Comment[pl]=Przeglądanie stron WWW 
Comment[pt]=Navegue na Internet
Comment[pt_BR]=Navegue na Internet
Comment[ru]=Обозреватель Всемирной Паутины
Comment[sk]=Prehliadanie internetu
Comment[sv]=Surfa på webben
GenericName=Web Browser
GenericName[bg]=Интернет браузър
GenericName[ca]=Navegador web
GenericName[cs]=Webový prohlížeč
GenericName[de]=Webbrowser
GenericName[el]=Περιηγητής ιστού
GenericName[es]=Navegador web
GenericName[fa]=مرورگر اینترنتی
GenericName[fi]=WWW-selain
GenericName[fr]=Navigateur Web
GenericName[hu]=Webböngésző
GenericName[it]=Browser Web
GenericName[ja]=ウェブ・ブラウザ
GenericName[ko]=웹 브라우저
GenericName[nb]=Nettleser
GenericName[nl]=Webbrowser
GenericName[nn]=Nettlesar
GenericName[no]=Nettleser
GenericName[pl]=Przeglądarka WWW
GenericName[pt]=Navegador Web
GenericName[pt_BR]=Navegador Web
GenericName[ru]=Интернет-браузер
GenericName[sk]=Internetový prehliadač
GenericName[sv]=Webbläsare
X-GNOME-FullName=Firefox Web Browser
X-GNOME-FullName[bg]=Интернет браузър (Firefox)
X-GNOME-FullName[ca]=Navegador web Firefox
X-GNOME-FullName[cs]=Firefox Webový prohlížeč
X-GNOME-FullName[el]=Περιηγήτης Ιστού Firefox
X-GNOME-FullName[es]=Navegador web Firefox
X-GNOME-FullName[fa]=مرورگر اینترنتی Firefox
X-GNOME-FullName[fi]=Firefox-selain
X-GNOME-FullName[fr]=Navigateur Web Firefox
X-GNOME-FullName[hu]=Firefox webböngésző
X-GNOME-FullName[it]=Firefox Browser Web
X-GNOME-FullName[ja]=Firefox ウェブ・ブラウザ
X-GNOME-FullName[ko]=Firefox 웹 브라우저
X-GNOME-FullName[nb]=Firefox Nettleser
X-GNOME-FullName[nl]=Firefox webbrowser
X-GNOME-FullName[nn]=Firefox Nettlesar
X-GNOME-FullName[no]=Firefox Nettleser
X-GNOME-FullName[pl]=Przeglądarka WWW Firefox
X-GNOME-FullName[pt]=Firefox Navegador Web
X-GNOME-FullName[pt_BR]=Navegador Web Firefox
X-GNOME-FullName[ru]=Интернет-браузер Firefox
X-GNOME-FullName[sk]=Internetový prehliadač Firefox
X-GNOME-FullName[sv]=Webbläsaren Firefox
Exec=firefox %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=firefox
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Firefox-bin
StartupNotify=true
EOF
echo "Cleaning up..."
rm -rf firefox-"${version}" firefox-"${version}".tar.bz2

exit 0
