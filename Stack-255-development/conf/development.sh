yum install -y git ;
yum remove -y ruby ;
yum install -y jq ;
yum install -y which ;
yum install -y unzip ;
yum groupinstall "Development tools" -y ;
curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer ;
yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel \ 
libyaml-devel libffi-devel openssl-devel make \
bzip2 autoconf automake libtool bison iconv-devel ;
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import - ;
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import - ;
curl -L get.rvm.io | bash -s stab ;
source /etc/profile.d/rvm.sh ;
rvm reload  ;
rvm requirements run ;
rvm install 2.3 ;
rvm use 2.3 --defau ;
gem install ftools ;
gem install rake ;
gem install colorize ;
gem install fileutils ;
gem install json ;
gem install closure-compiler ;
gem install compass ;
gem install rubyzip ;
yum install -y aws-cli ;