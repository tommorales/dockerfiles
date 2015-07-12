
# Instalación netCDF C/C++/Fortran para compilar el modelo WRF

#! /bin//ksh

PWD=$(pwd)
TEMP=
mkdir -p $PWD/netcdf/4.3.3.1
INSTALLDIR=$PWD/netcdf/4.3.3.1


# Descargamos netCDF C
install_netCDF-C(){
        echo "************************************************************"
        echo ""
        echo "                Instalando netCDF-C                         "
        echo ""
        echo "************************************************************"
	wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.3.3.1.tar.gz
	tar zxvf netcdf-4.3.3.1.tar.gz && cd netcdf-4.3.3.1
	./configure --prefix=${INSTALLDIR} --disable-netcdf-4
	make && make install
}


# netCDF-Fortran
install_netCDF-Fortran(){
        echo "************************************************************"
        echo ""
        echo "                Instalando netCDF-Fortran                   "
        echo ""
        echo "************************************************************"
	DIR1=$PWD/netcdf/4.3.3.1
	wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.4.2.tar.gz
	tar zxvf netcdf-fortran-4.4.2.tar.gz && cd netcdf-fortran-4.4.2
	
	CPPFLAGS="-I${DIR1}/include" \
        LD_LIBRARY_PATH=${DIR1}/lib:${LD_LIBRARY_PATH} \
	LDFLAGS=-L${DIR1}/lib \
        LIBS="-lnetcdf" \
	./configure --prefix=${DIR1}
	make && make install
}


# netCDF-C++
install_netCDF-C++(){	
        echo "************************************************************"
        echo ""
        echo "                 Instalando netCDF-C++                      "
        echo ""
        echo "************************************************************"
	DIR1=$PWD/netcdf/4.3.3.1
	wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-cxx-4.2.tar.gz
	tar zxvf netcdf-cxx-4.2.tar.gz && cd netcdf-cxx-4.2
	
	CPPFLAGS="-I${DIR1}/include" \
        LD_LIBRARY_PATH=${DIR1}/lib:${LD_LIBRARY_PATH} \
	LDFLAGS=-L${DIR1}/lib \
        LIBS="-lnetcdf" \
	./configure --prefix=${DIR1}
	make && make install
}


install_netCDF-C
install_netCDF-Fortran
#install_netCDF-C++
