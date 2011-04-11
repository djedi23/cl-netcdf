
(defun nctest ()
  (cffi:with-foreign-objects ((ncid :int)
			      (x-dimid :int)
			      (y-dimid :int)
			      )
    (netcdf::nc-create "/tmp/x.cdf" netcdf::+nc-clobber+ ncid)
    (netcdf::nc-def-dim (cffi:mem-ref ncid :int) "x" (cffi:make-pointer 17) x-dimid)
    (netcdf::nc-def-dim (cffi:mem-ref ncid :int) "yy" (cffi:make-pointer 7) y-dimid)

    (netcdf::nc-close (cffi:mem-ref ncid :int))
    ))