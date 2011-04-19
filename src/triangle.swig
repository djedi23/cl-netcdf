%module triangle

%feature("intern_function","1");
%feature("export");


%insert("lisphead") %{
 (defpackage :triangle-cffi
        (:nicknames :tri-c)
	(:use :cffi))
 (in-package :triangle-cffi)

 (define-foreign-library libtriangle
    (:unix "libtriangle.so")
    (t (:default "libtriangle")))

 (use-foreign-library libtriangle)

%}


//%ignore "_FillValue"
//%ignore "DIM_WITHOUT_VARIABLE"
%include "triangle.h"
