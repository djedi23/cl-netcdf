

swig:
	swig -cffi -noswig-lisp -I/usr/include/ netcdf.swig
	sed -e 's/\([0-9]\)U\?L\+/\1/;s/#oL/0/;/^.*_FillValue.*/d;/^.*DIM_WITHOUT_VARIABLE.*/d;/.*NC_FILL_STRING.*/d;s/\&rest/cl:\&rest/' netcdf.lisp > /tmp/x.lisp
	mv /tmp/x.lisp netcdf.lisp
