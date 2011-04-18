
;; http://localhost/doc/netcdf-doc/netcdf-tutorial.html#simple_005fxy_005fwr_002ec

(defun nctest ()
  (let ((xd 17)
	(yd 7))
    (cffi:with-foreign-objects ((ncid :int)
				(x-dimid :int)
				(y-dimid :int)
				(dimsid :int 2)
				(varid :int)
				(data :int (* xd yd))
				)
      (nc-c:create "/tmp/x.cdf" nc-c:+clobber+ ncid)
      (nc-c:def-dim (cffi:mem-ref ncid :int) "x" (cffi:make-pointer xd) x-dimid)
      (nc-c:def-dim (cffi:mem-ref ncid :int) "yy" (cffi:make-pointer yd) y-dimid)
      (setf (cffi:mem-aref dimsid :int 0) (cffi:mem-ref x-dimid :int))
      (setf (cffi:mem-aref dimsid :int 1) (cffi:mem-ref y-dimid :int))
      (nc-c:def-var (cffi:mem-ref ncid :int) "data" nc-c:+int+ 2 dimsid varid)
      (nc-c:enddef (cffi:mem-ref ncid :int))


      (dotimes (i (* xd yd))
	(setf (cffi:mem-aref data :int i) i))
      (nc-c:put-var-int (cffi:mem-ref ncid :int) (cffi:mem-ref varid :int)
			data)
      
      (nc-c:close (cffi:mem-ref ncid :int))
      )))


(defun nctest1 ()
  (declare (optimize (debug 3)))
  (let ((xd 17)
	(yd 7)
	(cdf 0))
    (cffi:with-foreign-objects ((ncid :int)
				(x-dimid :int)
				(y-dimid :int)
				(dimsid :int 2)
				(varid :int)
				(data :int (* xd yd))
				)
      (nc-c:create "/tmp/x.cdf" nc-c:+clobber+ ncid)
      (setq cdf (make-instance 'netcdf::netcdf :id (cffi:mem-ref ncid :int)))

      (nc-c:def-dim (netcdf::id cdf) "x" (cffi:make-pointer xd) x-dimid)
      (netcdf::put-dimension cdf "x" (cffi:mem-ref x-dimid :int))
      (nc-c:def-dim (netcdf::id cdf) "yy" (cffi:make-pointer yd) y-dimid)
      (netcdf::put-dimension cdf "yy" (cffi:mem-ref y-dimid :int))

      (setf (cffi:mem-aref dimsid :int 0) (netcdf::get-dimension cdf "x"))
      (setf (cffi:mem-aref dimsid :int 1) (netcdf::get-dimension cdf "yy"))
      (nc-c:def-var (netcdf::id cdf) "data" nc-c:+int+ 2 dimsid varid)
      (netcdf::put-variable cdf "data" (cffi:mem-ref varid :int))
      (nc-c:enddef (netcdf::id cdf))


      (dotimes (i (* xd yd))
	(setf (cffi:mem-aref data :int i) i))
      (nc-c:put-var-int (netcdf::id cdf) (netcdf::get-variable cdf "data")
			data)
      
      (nc-c:close (netcdf::id cdf))
      )))


(defun nctest2 ()
  (declare (optimize (debug 3)))
  (let ((xd 10)
	(yd 7)
	(cdf (nc:create "/tmp/x.cdf")))
    (nc:def-dim cdf "x" xd)
    (nc:def-dim cdf "y" yd)
    (nc:def-var cdf "data" nc-c:+int+ '("x" "y"))

    (nc:enddef cdf)
    (nc:nc-close cdf)

    ))