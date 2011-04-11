

swig:
	swig2.0 -cffi -I/usr/include/ netcdf.swig
	sed -e 's/\([0-9]\)U\?L\+/\1/;s/#oL/0/' netcdf.lisp > /tmp/x.lisp
	mv /tmp/x.lisp netcdf.lisp