# connect via systems manager in aws console
sudo su
sudo yum update -y
sudo yum groupinstall -y "Development Tools"
sudo yum install -y python3 python3-pip unzip tar gcc gcc-c++ glibc-devel glibc-static libstdc++-static glibc-headers man-pages wget bison flex texinfo gmp-devel mpfr-devel libmpc-devel autoconf automake libtool gettext bison flex texinfo kernel-devel

# Make 4.3 steps here - rough steps with addition of make
make --version | grep "3\." && echo "Old make version setup :-("
make --version | grep "4\." && echo "New make version setup\! :D"
cd /tmp
wget https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
tar -xvf make-4.3.tar.gz
cd make-4.3
sudo ./configure
# ./configure --prefix=/usr/local  # Or your preferred place
sudo ./make
sudo ./make install # This will install the new version of make to /usr/local/bin.
./make -version # expecting GNU Make 4.3
sudo yum remove make -y
#sudo ln -sf /usr/local/bin/make /usr/bin/make
make --version # expecting GNU Make 4.3
# if more errors, double check simlink # ls -l /usr/bin/make
