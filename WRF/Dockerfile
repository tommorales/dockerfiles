
##################################################
# Archivo Dockerfile para ejecutar modelo WRF
# Basado en imagen de Ubuntu
##################################################

# Establece la imagen de base a utilizar para Ubuntu
FROM ubuntu

# Estable el autor del archivo
MAINTAINER Tomas Morales

# Actualización de la lista de fuentes del repositorio de aplicaciones por defecto
RUN apt-get update

RUN apt-get install -y git
RUN apt-get install -y make
RUN apt-get install -y g++
RUN apt-get install -y gfortran
RUN apt-get install -y python 

# Install WRF

# 1) Install librería netCDF
RUN mkdir -p /lib/gnu/netcdf/4.3.3.1
# C
RUN cd /tmp ; wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.3.3.1.tar.gz
RUN cd /tmp && tar zxvf netcdf-4.3.3.1.tar.gz
RUN cd /tmp/netcdf-4.3.3.1 ; ./configure --prefix=/lib/gnu/netcdf/4.3.3.1 && make install
# Fortran
RUN /tmp ; wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.4.2.tar.gz
RUN cd /tmp && tar zxvf netcdf-fortran-4.4.2.tar.gz
RUN cd /tmp/netcdf-fortran-4.4.2 ; ./configure --prefix=/lib/gnu/netcdf/4.3.3.1 && make install

# 2) Install WRF
#RUN mkdir -p /WRF/WRFV3.7
#RUN cd /WRF/WRFV3.7 ; wget http://www2.mmm.ucar.edu/wrf/src/WRFV3.7.TAR.gz
#RUN cd /WRF/WRFV3.7 ; export NETCDF=/lib/gnu/netcdf/4.3.3.1   
