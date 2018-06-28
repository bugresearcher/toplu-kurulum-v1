#!/bin/bash

##############################################################################################
# Yapimci:ASOSYAL HATUN	                                                                     #
##############################################################################################

site="https://ts3.web.tr"

yanlis="
\033[1;33m###################################################################\033[1;32m \033[0m
\033[1;33m#                                                                 #\033[1;32m \033[0m
\033[1;33m    \033[1;33m=> Yanlis tuslama yapildi, script kapatiliyor.      \033[0m      \033[1;33m \033[0m
\033[1;33m#                                                                 #\033[1;33m \033[0m
\033[1;33m###################################################################\033[1;32m \033[0m

"


ip=`ip addr show |grep "inet " |grep -v 127.0.0. |head -1|cut -d" " -f6|cut -d/ -f1`
#--------------------------------------------------------------------------------------#
update_sorun(){
clear
sleep 0.5
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m     \033[1;33m=> cURL kütüphanesi eksik, lütfen yükleyin.      \033[0m         \033[1;33m \033[0m"
echo -e "\033[1;33m#    \033[1;31m=> apt-get install curl                        \033[0m\033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
exit

}

#--------------------------------------------------------------------------------------#
ana_kurulum_ts3(){
clear
sleep 0.1
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
	echo -e "\033[1;33m#   \033[0;36m=> TS3 Kurulumu                            \033[1;33m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
	echo -e "\e[92mKurulum başlıyor!"
	sleep 3
	clear
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m                => TeamSpeak3 Kurulumu Başlıyor            \033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
sleep 1
 
 
apt-get -qq install wget -y
cd /root/
wget -q $site/dosyalar/server.zip --no-check-certificate
unzip server.zip
rm -fr server.zip
grep -v '.*teamspeak.*' /etc/hosts > /etc/hosts_temporary
mv /etc/hosts_temporary /etc/hosts
grep -v '.*symcb.*' /etc/hosts > /etc/hosts_temporary
mv /etc/hosts_temporary /etc/hosts
grep -v '.*thawte.*' /etc/hosts > /etc/hosts_temporary
mv /etc/hosts_temporary /etc/hosts
grep -v '.*usertrust.*' /etc/hosts > /etc/hosts_temporary
mv /etc/hosts_temporary /etc/hosts
grep -v '.*elasticbeanstalk.*' /etc/hosts > /etc/hosts_temporary
mv /etc/hosts_temporary /etc/hosts
grep -v '.*ocsp\.digicert.com.*' /etc/hosts > /etc/hosts_temporary
mv /etc/hosts_temporary /etc/hosts

echo "127.0.0.1       thawte.com" >> /etc/hosts
echo "127.0.0.1       symcb.com" >> /etc/hosts
echo "127.0.0.1       usertrust.com" >> /etc/hosts
echo "127.0.0.1       elasticbeanstalk.com" >> /etc/hosts
echo "127.0.0.1       reportpiracy-env.elasticbeanstalk.com" >> /etc/hosts
echo "127.0.0.1       weblist.teamspeak.com" >> /etc/hosts
echo "127.0.0.1       hardy.teamspeak.4players.de" >> /etc/hosts
echo "127.0.0.1       ocsp.digicert.com" >> /etc/hosts
echo "127.0.0.1       ipcheck.teamspeak.com" >> /etc/hosts
echo "# 127.0.0.1       blacklist.teamspeak.com" >> /etc/hosts
echo "127.0.0.1       backupaccounting.teamspeak.com" >> /etc/hosts
echo "127.0.0.1       accounting.teamspeak.com" >> /etc/hosts
echo "127.0.0.1       teamspeak.com" >> /etc/hosts

cd /root/server
chmod 777 ts3server
chmod 777 ts3server_startscript.sh
chmod 777 AccountingServerEmulator-Linux

sleep 2
clear
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m                => İstediğiniz Query Port           \033[1;33m \033[0m"
echo -e "\033[1;33m                => Default 10011           \033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
read qport

echo "query_port=$qport" >> /root/server/ts3server.ini

sleep 2
clear
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m                => İstediğiniz Query Şifresi           \033[1;33m \033[0m"
echo -e "\033[1;33m                => Yatqa v.b Bağlanmak için           \033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
read yatqapas

echo "serveradmin_password=$yatqapas" >> /root/server/ts3server.ini

sleep 2
clear
su root -c "./AccountingServerEmulator-Linux"
su root -c "./ts3server_startscript.sh start"
sleep 2
clear
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
	echo -e "\033[1;33m    \033[0;36m=> Ts3 Kurulumu Bitmiştir.                             \033[1;33m \033[0m"	
	echo -e "\033[1;33m    \033[0;36m=> Artık Sunucunuzu Yönetebilirsiniz                             \033[1;33m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
}


#--------------------------------------------------------------------------------------#
ana_kurulum_vhost(){
clear
sleep 0.1
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
	echo -e "\033[1;33m#   \033[0;36m=> vHost Kurulumu                            \033[1;33m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
	echo -e "\e[92mKurulum başlıyor!"
	sleep 3
	clear
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m                => Host Kurulumu Başlıyor            \033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
sleep 1
echo -e "\e[92m"
apt-get install apache2
clear
apt-get install mysql-server
clear
apt-get install php5-mysql
clear
apt-get install php5
clear
clear
sleep 1
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m                => PhpMyAdmin Kuruluyor..            \033[1;33m \033[0m"
echo -e "\033[1;33m                => Önce Apache Sonra NO Seç!            \033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
sleep 4
apt-get install phpmyadmin
clear
apt-get install libapache2-mod-php5 
clear

cd /var/www/html
ln -s /usr/share/phpmyadmin
clear
sleep 1
service apache2 restart
service apache restart
clear
sleep 3
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m         => vHost Kurulumu ve Phpmyadmin Ayarlaması Yapıldı            \033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
clear
sleep 1

clear
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
	echo -e "\033[1;33m    \033[0;36m=> Host Kurulumu Bitmiştir.                             \033[1;33m \033[0m"	
	echo -e "\033[1;33m    \033[0;36m=> Artık Sitenizi Yönetebilirsiniz                             \033[1;33m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
}


ana_kurulum_bilesenkur(){
klas1="/opt/ts3"
klas2="/opt/ytdl"
clear
sleep 0.1
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
	echo -e "\033[1;33m#   \033[0;36m=> Temel Bileşenler Kurulum Sihirbazı                            \033[1;33m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
	echo -e "\e[92mKurulum başlıyor!"
	sleep 3
	clear
echo -e "\e[92m"
sudo apt-get update -y 
clear
cd /root
clear
wget https://ts3.web.tr/dosyalar/bot_baslat.sh
clear
chmod 777 bot_baslat.sh
clear
mkdir jts3bot
clear
sudo apt-get install sudo -y 
clear
sudo apt-get install nano -y 
clear
apt-get install openjdk-6-jre
clear
apt-get install rar -y
clear
apt-get install unrar -y    
clear
apt-get -f install -y 
clear
apt-get -qq install unzip -y
clear
apt-get -qq install wget -y
clear
apt-get -qq install curl -y
clear
apt-get -qq install screen x11vnc xvfb libxcursor1 ca-certificates bzip2 psmisc libglib2.0-0 less -y
clear
su root -c "update-ca-certificates"
clear
apt-get -qq install youtube-dl -y
clear
sudo youtube-dl --update
clear
apt-get install sqlite3 -y
clear
sudo curl -s -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
clear
sudo chmod a+rx /usr/local/bin/youtube-dl
clear
cd /opt/
wget https://ts3.web.tr/dosyalar/ts.zip
unzip ts.zip
cd TeamSpeak3-Client-linux_amd64
chmod 777 ts3client_linux_amd64
rm -fr ts.zip
sleep 1
clear
sleep 1
clear
if [ -d "/home/sinusbot" ] 
then
clear
else
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m                => Sinusbot Kullanıcı Bulunamadı!             \033[1;33m \033[0m"
echo -e "\033[1;33m                => SinusBot kullanıcısı Oluşturuluyor        \033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"

nohup useradd -m -p ATQQvaDHQ2r sinusbot
sleep 2
clear
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m                => Sinusbot Kullanıcısı Oluşturuldu             \033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
sleep 1
clear
fi
sleep 2
clear
clear
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
	echo -e "\033[1;33m    \033[0;36m=> Temel Bileşenler Kuruldu.                             \033[1;33m \033[0m"	
	echo -e "\033[1;33m    \033[0;36m=> Artık Sinusbot Kurabilirsiniz.                             \033[1;33m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
}


ana_hata_loglevel(){
clear
echo -e -n "\033[1;36mPort: \033[0m"
read hataport
case $hataport in
    * )
sleep 1
sed -i -e "s/LogLevel = 3/LogLevel = 10/g" "/opt/sinusbot$hataport/config.ini"
sleep 1
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m    => $hataport Portuna Bağlı Sinusbot LogLevel Sorunu Giderildi    \033[1;32m \033[0m"
echo -e "\033[1;33m    => $hataport Portuu Resetleyiniz    \033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"

	;;
esac

}


ana_hata_ytdl(){
sleep 1
clear
cd /usr/local/bin/
rm -fr youtube-dl
echo -e "\033[1;33mDosyalar indiriliyor..\033[0m"
sleep 1
nohup wget https://yt-dl.org/downloads/latest/youtube-dl --no-check-certificate
echo -e "\033[1;36mDosyalar başarıyla indirildi.\033[0m"
sleep 2
chmod a+rx youtube-dl
clear
sleep 1
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m    => Youtube-dl sorunu giderildi    \033[1;32m \033[0m"
echo -e "\033[1;33m    => TümBotları Yeniden Başlatın    \033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"

}

ana_hata(){
clear

	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
	echo -e "\033[1;33m           \033[0;36m=> Sinusbot Hata Çözümleri\033[0m                       \033[1;33m \033[0m"
	echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
	echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
	echo -e "\033[1;36m1) LogLevel Hatası Çözümü\033[0m"
	echo -e "\033[1;36m2) youtube-dl Hataları Çözümü\033[0m"
	echo -e "\033[1;36m0) Çıkış\033[0m"

read hataport
case $hataport in
1)
ana_hata_loglevel
;;
2)
ana_hata_ytdl
;;
#-------------------------------------------------------------------------------#
0)
clear
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m          \033[1;33m=> Script Kapatılıyor.      \033[0m      \033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
sleep 1
exit
clear
;;
#-------------------------------------------------------------------------------#
esac
}



ana_kurulum_cpanel(){
sleep 1
clear
systemctl stop NetworkManager.service
systemctl disable NetworkManager.service
service NetworkManager stop
chkconfig NetworkManager off
clear
cd /home
curl -o latest -L https://securedownloads.cpanel.net/latest
chmod a+x latest
sh latest
sleep 1
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m    => cPanel Kuruldu    \033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"

}

ana_kurulum_cwp(){
sleep 1
clear
cd /usr/local
curl -o latest -L http://centos-webpanel.com/cwp-latest
chmod a+x cwp-latest
sh cwp-latest
sleep 1
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m    => CWP Kuruldu    \033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"

}


ana_kurulum_ddoscler(){
sleep 1
clear
cd /home
wget http://api.exect1337.com/tools.tar
chmod a+x tools.tar
tar xvf tools.tar
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m    => DDOS SALDIRI ve Exploit Scriptleri Kuruldu    \033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"

}

ana_kurulum_gelistirici(){
sleep 1
clear
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m    => Bu Script HasanAtilan.Com Tarafından    \033[1;32m \033[0m"
echo -e "\033[1;33m    => AsosyalHatun'a Özel Yapılmıştır..    \033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"

}

ana_kurulum_plesk(){
sleep 1
clear
yum upgrade -y
apt-get upgrade -y
yum install gcc -y
apt-get install gcc -y
clear
cd /root
wget -O – http://autoinstall.plesk.com/one-click-installer | sh
curl http://autoinstall.plesk.com/one-click-installer | sh
sleep 1
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m    => Plesk Panel Kuruldu   \033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"

}

#--------------------------------------------------------------------------------------#
if (( $EUID != 0 )); then
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m                  \033[1;33m=> Maalesef, devam edemiyoruz!      \033[0m              \033[1;33m \033[0m"
echo -e "\033[1;33m                  \033[1;31m=> Devam etmek icin, ROOT gereklidir! \033[1;37m~              \033[0m\033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
exit
fi
clear

command -v curl >/dev/null 2>&1 || error_curl="1"
if [[ $error_curl -eq 1 ]]
	then
sleep 1
update_sorun
fi
sleep 0.5
clear
echo -e "\033\e[93mScript Açılıyor [ASOSYALHATUN V1.0]\033[0m"
sleep 4
clear
	echo -e "\033[1;33m######################################################################\033[1;32m \033[0m"
	echo -e "\033[1;33m# \033[0;36m=>  Yapimci: ASOSYALHATUN \033[0m                       \033[1;33m \033[0m"
	echo -e "\033[1;33m# \033[0;36m=>  Website: wwww.exect1337.com   	 \033[0m                       \033[1;33m \033[0m"
	echo -e "\033[1;33m# \033[0;36m=>  İnstagram: @bugresearcher   	 \033[0m                       \033[1;33m \033[0m"
	echo -e "\033[1;33m# \033[0;36m=>  Twitter: @bugresearcher   	 \033[0m                       \033[1;33m \033[0m"
	echo -e "\033[1;33m# \033[0;36m=>  Telegram: @bugresearcher   	 \033[0m                       \033[1;33m \033[0m"
	echo -e "\033[1;33m######################################################################\033[1;32m \033[0m"
	echo -e "\033[1;31m1)  Temel Bilesenleri Kur (Sinusbot ve Ts3 için)\033[0m"
	echo -e "\033[0;32m2)  Host Kurulumu (Site İçin)\033[0m"
	echo -e "\033[1;31m3)  Sinusbot Hata Çözümleri\033[0m"
	echo -e "\033[0;32m4)  TeamSpeak3 Kurulumu\033[0m"
	echo -e "\033[1;31m5)  cPanel Kurulumu\033[0m"
	echo -e "\033[0;32m6)  Plesk Kurulumu\033[0m"
	echo -e "\033[1;31m7)  CWP Kurulumu\033[0m"
	echo -e "\033[0;32m8)  Proxy Olustur\033[0m"
	echo -e "\033[1;31m9)  DDOSGuard Kurulumu\033[0m"
	echo -e "\033[0;32m10) DDOS ve Exploit Scriptleri\033[0m"
	echo -e "\033[1;31m11) SMS Gönder\033[0m"
	echo -e "\033[0;32m12) Geliştiriciler\033[0m"
	echo -e "\033[1;31m13) Çıkış\033[0m"
read secenek

case $secenek in
 1)
ana_kurulum_bilesenkur
 ;;
 2)
ana_kurulum_vhost
 ;;
 3)
ana_hata
 ;;
 4)
ana_kurulum_ts3
 ;;
 5)
ana_kurulum_cpanel
 ;;
 6)
ana_kurulum_plesk
 ;;
 7)
ana_kurulum_cwp
 ;;
 8)
ana_kurulum_proxy
 ;;
 9)
ana_kurulum_ddosguard
 ;;
 10)
ana_kurulum_ddoscler
 ;; 
 11)
ana_kurulum_smsgonder
 ;; 
  13)
ana_kurulum_gelistiriciler
 ;; 
 14)
 clear
 exit
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m          \033[1;33m=> Yanlis tuslama yapildi, script kapatiliyor.      \033[0m      \033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
exit
;;

esac