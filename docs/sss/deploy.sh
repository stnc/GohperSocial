#git add .
#git commit -m "feat: otoGonder"
#git push
#
#rm -rf main
#
## GOOS=linux GOARCH=386 go build main.go
#GOOS=linux GOARCH=amd64 go build main.go
#tar -cvzf static.tar.gz public/static/*
#
#tar -cvzf view.tar.gz public/view/*
#
#tar -cvzf locales.tar.gz public/locales/*
#
#rm -rf CI/*
#
#mv static.tar.gz CI/static.tar.gz
#
#mv view.tar.gz CI/view.tar.gz
#
#mv locales.tar.gz CI/locales.tar.gz
#
##tar -xvf static.tar.gzQ
#

# check if command line argument is empty or not present

what="$1"

#https://unix.stackexchange.com/questions/462515/check-command-line-arguments

if [ -z $1 ]; then
        echo "Parameter 1 is empty"
        exit 0
#elif [ "$1" == "" ] || [ $# -gt 1 ]; then
#        echo "selman"
#        exit 0


#elif [ "${#timestamp}" -lt 10 ]; then
#        echo "Please enter at least a valid date"
#        echo "Example: 2018-08-14"
#        exit 0
elif [ "$1" == "git" ]; then
        git add .
        git commit -m "feat: automatic SEND"
        git push
        exit 0
elif [ "$1" == "all" ]; then
        rm -rf main

        GOOS=linux GOARCH=arm GOARM=5 go build main.go

        cp other/hestiaGO/* .

        tar -cvzf all.tar.gz public/static/* public/locales/* public/view/*  ServerDeploy.sh move.sh golang.tpl golang.stpl .env main

        rm golang.stpl

        rm golang.tpl

        rm move.sh

        rm ServerDeploy.sh

        mkdir CI

        rm -rf CI/*

        mv all.tar.gz CI/all.tar.gz

        scp -i oracle.key CI/all.tar.gz ubuntu@141.144.242.109:/home/ubuntu

        exit 0
elif [ "$1" == "view" ]; then

        rm -rf main

        GOOS=linux GOARCH=arm GOARM=5 go build main.go

        tar -cvzf view.tar.gz public/locales/* public/view/*  main

        mkdir CI

        rm -rf CI/*

        mv view.tar.gz CI/view.tar.gz

        scp -i oracle.key CI/view.tar.gz ubuntu@141.144.242.109:/home/ubuntu

        exit 0
elif [ "$1" == "kkkk" ]; then
  # kurulum
        sudo apt-get update && apt-get upgrade

        wget https://raw.githubusercontent.com/hestiacp/hestiacp/release/install/hst-install.sh

        sudo bash hst-install.sh --apache no --phpfpm no --multiphp no --vsftpd yes --proftpd no --named yes --mysql no --postgresql yes --exim no --dovecot no --sieve no --clamav no --spamassassin no --iptables yes --fail2ban yes --quota no --api yes --interactive yes --with-debs no  --port 2083 --hostname panel.kurbandefteri.com --email selmantunc@yandex.com --password fdsdf4325435h6h --lang en  --force

        ## mail servisi olan
         sudo bash hst-install.sh --apache no --phpfpm no --multiphp no --vsftpd no --proftpd yes --named yes --mysql yes --postgresql yes --exim yes --dovecot yes --sieve no --clamav yes --spamassassin yes --iptables yes --fail2ban yes --quota no --api yes --interactive yes --with-debs no  --port 2083 --hostname panel.kurbandefteri.com --email selmantunc@yandex.com --password fdsdf4325435h6h --lang en  --force

#sunucuya gonderdikten sonra acmak icin
        sudo su

        cd /home/ubuntu

        mv  all.tar.gz /home/admin/web/kys.kurbandefteri.com/public_html

        cd /home/admin/web/kys.kurbandefteri.com/public_html

        tar -xvf all.tar.gz

       scp -i oracle.key main ubuntu@141.144.242.109:/home/ubuntu

       chmod +rwx main


          #the full path is /usr/share/phppgadmin/classes/database/Connection.php


        #in the directory classes/database adjust the file connection.php switch (substr($version,0,3)) {
        #
        #        case '9.2': return 'Postgres'; break;
        #        case '9.1': return 'Postgres91'; break;
        #        case '9.0': return 'Postgres90'; break;
        #        case '8.4': return 'Postgres84'; break;
        #        case '8.3': return 'Postgres83'; break;
        #        case '8.2': return 'Postgres82'; break;
        #        case '8.1': return 'Postgres81'; break;
        #        case '8.0':
        #        case '7.5': return 'Postgres80'; break;
        #        case '7.4': return 'Postgres74'; break;
        #        default: return 'Postgres'; break;
        #    }





else
        echo "THIS IS THE VALID BLOCK"
fi


