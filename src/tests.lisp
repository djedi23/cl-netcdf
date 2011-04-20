
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
  (let* ((xd 10)
	 (yd 7)
	 (cdf (nc:create "/tmp/x.cdf"))
	 (ar (make-array (* xd yd))))
    (nc:def-dim cdf "x" xd)
    (nc:def-dim cdf "y" yd)
    (nc:def-var cdf "data" nc-c:+int+ '("x" "y"))
    (nc:enddef cdf)

    (dotimes (i (* xd yd))
      (setf (aref ar i) i))

    (nc:put-var-int cdf "data" ar)
    (nc:nc-close cdf)

    ))

(defun nctest3 ()
  (declare (optimize (debug 3)))
  (let* ((axes 2)
	 (points 1000)
	 (cdf (nc:create "/tmp/x.nc"))
	 (ar (make-array (* 3 points))))
    (nc:def-dim cdf "axes" axes)
    (nc:def-dim cdf "tri" 3)
    (nc:def-dim cdf "points" points)
    (nc:def-dim cdf "time" nc-c:+unlimited+)
    (nc:def-var cdf "locations" nc-c:+float+ '("points" "axes"))
    (nc:def-var cdf "connections" nc-c:+int+ '("points" "tri"))
    (nc:def-var cdf "data" nc-c:+float+ '("time" "points"))
    (nc:put-att-text cdf "data" "field" "data, scalar,series")
    (nc:put-att-text cdf "data" "positions" "locations")
    (nc:put-att-text cdf "data" "connections" "connections,triangles") 

    ;; (nc:def-var cdf "data" nc-c:+int+ '("x" "y"))
    ;; (nc:put-att-text cdf "data" "attribut" "totitit")
    
    (nc:enddef cdf)

    (dotimes (i (* axes points))
      (setf (aref ar i) (random 1000)))
    (nc:put-var-int cdf "locations" ar)
    (dotimes (i (* 3 points))
      (setf (aref ar i) (random points)))
    (nc:put-var-int cdf "connections" ar)


    ;; (dotimes (i (* 2 points))
    ;;   (setf (aref ar i) (random 100)))
    ;; (nc:put-var-int cdf "data"ar)


    (dotimes (i points)
      (setf (aref ar i) (random 100)))
    (nc:put-vara-int cdf "data" #(0 0) #(1 1000) ar)
    (dotimes (i points)
      (setf (aref ar i) (random 100)))
    (nc:put-vara-int cdf "data" #(1 0) #(1 1000) ar)

    (nc:nc-close cdf)

    ))


(defun tritext (&optional (n 10))
  (declare (optimize (debug 3)))
  (cffi:with-foreign-objects ((in 'tri-c:triangulateio)
			      (out 'tri-c:triangulateio)
			      (vor 'tri-c:triangulateio)
			      (ptlist :double (* n 2)))
    (setf (cffi:foreign-slot-value in 'tri-c:triangulateio 'tri-c:numberofpoints) n)
    (setf (cffi:foreign-slot-value in 'tri-c:triangulateio 'tri-c:numberofsegments) 0)
    (setf (cffi:foreign-slot-value in 'tri-c:triangulateio 'tri-c:numberofholes) 0)
    (setf (cffi:foreign-slot-value in 'tri-c:triangulateio 'tri-c:numberofregions) 0)
    (dotimes (i (* 2 n))
      (setf (cffi:mem-aref ptlist :double i) (coerce (random 1000.0) 'double-float)))
    (setf (cffi:foreign-slot-value in 'tri-c:triangulateio 'tri-c:pointlist) ptlist)

    (setf (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:edgelist) (cffi-sys:null-pointer))
    (setf (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:edgemarkerlist) (cffi-sys:null-pointer))
    (setf (cffi:foreign-slot-value vor 'tri-c:triangulateio 'tri-c:numberofpoints) 0)

    (tri-c:triangulate "z" in out vor)


    ;; (dotimes (i (* (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:numberofcorners) 
    ;; 		   (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:numberoftriangles)))
    ;;   (print (cffi:mem-aref (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:trianglelist) :int i))
    ;;   )

    (format T "corner:~a triangle:~a~%"
	    (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:numberofcorners) 
	    (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:numberoftriangles))

    ))
