%module netcdf

%feature("intern_function","1");


%insert("lisphead") %{
 (defpackage :netcdf
	(:use :cffi :cl))
 (in-package :netcdf)

 (define-foreign-library libnetcdf
    (:unix "libnetcdf.so")
    (t (:default "libnetcdf")))

 (use-foreign-library libnetcdf)
%}


//%ignore "_FillValue"
//%ignore "DIM_WITHOUT_VARIABLE"
%include "netcdf.h"
