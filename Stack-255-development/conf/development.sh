yum install -y git ;
yum remove -y ruby ;
yum install -y jq ;
yum install -y which ;
yum install -y unzip ;
yum groupinstall "Development tools" -y ;
curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer ;
yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel ;
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 ;
curl -sSL https://get.rvm.io | bash -s stable ;
usermod -a -G rvm `whoami` ;
sleep 120 ;
#source /usr/local/rvm/bin/rvm ;
/usr/local/rvm/bin/rvm reload ;
/usr/local/rvm/bin/rvm requirements run ;
/usr/local/rvm/bin/rvm install 2.3 ;
/usr/local/rvm/bin/rvm use 2.3 --default ;
gem install ftools ;
gem install rake ;
gem install colorize ;
gem install fileutils ;
gem install json ;
gem install closure-compiler ;
gem install compass ;
gem install rubyzip ;
yum install -y aws-cli ;