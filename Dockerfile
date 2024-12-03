FROM voxpupuli/centos6

RUN yum update && yum install -y build-essential wget gcc git g++ libc6 file curl 

WORKDIR /simplescalar

RUN git clone https://github.com/toddmaustin/simplesim-3.0 

WORKDIR /simplescalar/simplesim-3.0

RUN make config-pisa && make && make sim-tests \
&& curl --output simplesim.tar.gz ftp.cs.wisc.edu/sohi/Code/simplescalar/simplesim.tar.gz \
&& gunzip simplesim.tar.gz && tar -xvf simplesim.tar \ 
&& curl --output simpletools-2.0.tar.gz ftp.cs.wisc.edu/sohi/Code/simplescalar/simpletools-2.0.tar.gz \
&& gunzip simpletools-2.0.tar.gz && tar -xvf simpletools-2.0.tar \
&& curl --output simpleutils-2.0d.tar.gz ftp.cs.wisc.edu/sohi/Code/simplescalar/simpleutils-2.0d.tar.gz \
&& gunzip simpleutils-2.0d.tar.gz && tar -xvf simpleutils-2.0d.tar \
&& cd binutils-2.5.2/ \
&& ./configure --host=i386-*-gnu/linux --target=ssbig-na-sstrix --with-gnu-as --with-gnu-ld --prefix=../ \
&& make && make install && cd ../simplesim-2.0/ && make && make install \
&& cd ../gcc-2.6.3/ \
&& ./configure --host=i386-*-gnu/linux --target=ssbig-na-sstrix --with-gnu-as --with-gnu-ld --prefix=../ \
&& make LANGAUGES=c && make install \
&& cd .. \
