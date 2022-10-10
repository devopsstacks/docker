## INSTALL PHP ##
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y php81
yum install -y php81-php-gd php81-php-zip php81-php-mysqlnd php81-php-soap php81-php-mbstring php81-php-ldap php81-php-mcrypt php81-php-xml php81-php-imap
yum install -y php56
yum install -y php56-php-gd php56-php-zip php56-php-mysqlnd php56-php-soap php56-php-mbstring php56-php-ldap php56-php-mcrypt php56-php-xml php56-php-imap
yum install -y php70
yum install -y php70-php-gd php70-php-zip php70-php-mysqlnd php70-php-soap php70-php-mbstring php70-php-ldap php70-php-mcrypt php70-php-xml php70-php-imap
yum install -y php71
yum install -y php71-php-gd php71-php-zip php71-php-mysqlnd php71-php-soap php71-php-mbstring php71-php-ldap php71-php-mcrypt php71-php-xml php71-php-imap
yum install -y php74
yum install -y php74-php-gd php74-php-zip php74-php-mysqlnd php74-php-soap php74-php-mbstring php74-php-ldap php74-php-mcrypt php74-php-xml php74-php-imap
ln -s /usr/bin/php71 /usr/bin/php
## INSTALL RUBY 2.4 ##
yum install git -y
yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
git config --global url.https://github.com/.insteadOf git://github.com/
git clone git://github.com/rbenv/rbenv.git /usr/local/rbenv \
&&  git clone git://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build \
&&  git clone git://github.com/jf/rbenv-gemset.git /usr/local/rbenv/plugins/rbenv-gemset \
&&  /usr/local/rbenv/plugins/ruby-build/install.sh
echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh \
&&  echo 'export PATH=/usr/local/rbenv/bin:$PATH' >> /etc/profile.d/rbenv.sh \
&&  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT=/usr/local/rbenv' >> /root/.bashrc \
&&  echo 'export PATH=/usr/local/rbenv/bin:$PATH' >> /root/.bashrc \
&&  echo 'eval "$(rbenv init -)"' >> /root/.bashrc
RUN eval "$(rbenv init -)"; rbenv install $RBENV_VERSION \
&&  eval "$(rbenv init -)"; rbenv global $RBENV_VERSION \
&&  eval "$(rbenv init -)"; gem update --system \
&&  eval "$(rbenv init -)"; gem install bundler -f \
&&  rm -rf /tmp/*
##  ADDITIONAL ##
yum -y install https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm
yum install -y git ;
yum install -y wget ;
yum install -y jq ;
yum install -y which ;
yum install -y unzip ;
yum groupinstall "Development tools" -y ; X
curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer ;
cp /usr/local/bin/composer /tmp/composer.phar ;
yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel ;
yum install awscli -y ;
## Ruby ##
gem install ftools ;
gem install rake ;
gem install colorize ;
gem install fileutils ;
gem install json
gem install closure-compiler ;
gem install compass ;
gem install rubyzip ;
## NodeJS ##
wget https://rpm.nodesource.com/setup_12.x ;
sh setup_12.x ;
yum -y install nodejs ; 
npm install -g @vue/cli ;

##### clean #####
yum clean packages ;
yum clean headers ;
yum clean metadata ;
yum clean all

##### httpd #####
yum install httpd -y