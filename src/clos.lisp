(defpackage :netcdf
  (:nicknames :nc)
  (:use :cl)
  (:export
   nc-close
   copy-array
   create
   def-dim
   def-var
   enddef
   put-var-int
   put-var-double
   put-vara-int
   put-vara-double
   put-att-text

   triangulate
   ))
(in-package :netcdf)


(defclass netcdf ()
  ((id :initarg :id :accessor id)
   (dimensions :initform (make-hash-table :test 'equal))
   (variables :initform (make-hash-table :test 'equal))
   ))

(defun put-dimension (netcdf name id)
  (setf (gethash name (slot-value netcdf 'dimensions)) id))

(defun get-dimension (netcdf name)
  (multiple-value-bind (valeur trouve)
      (gethash name (slot-value netcdf 'dimensions))
    (if trouve
	valeur
	(error "%a non trouve dans les dimmensions" name)
	)))

(defun put-variable (netcdf name id)
  (setf (gethash name (slot-value netcdf 'variables)) id))

(defun get-variable (netcdf name)
  (multiple-value-bind (valeur trouve)
      (gethash name (slot-value netcdf 'variables))
    (if trouve
	valeur
	(error "%a non trouve dans les variables" name)
	)))


(defun create (path)
  (cffi:with-foreign-objects ((ncid :int))
    (nc-c:create path nc-c:+clobber+ ncid)
    (make-instance 'netcdf::netcdf :id (cffi:mem-ref ncid :int))))

(defun def-dim (cdf dim-name size)
  (cffi:with-foreign-objects ((dimid :int))
    (nc-c:def-dim (id cdf) dim-name (cffi:make-pointer size) dimid)
    (put-dimension cdf dim-name (cffi:mem-ref dimid :int))
    ))

(defun def-var (cdf var-name type dimensions)
  (cffi:with-foreign-objects ((varid :int)
			      (dimsid :int (length dimensions)))
    (loop for d in dimensions
       for i from 0
       do
	 (setf (cffi:mem-aref dimsid :int i) (get-dimension cdf d)))
    (nc-c:def-var (id cdf) var-name type (length dimensions) dimsid varid)
    (netcdf::put-variable cdf var-name (cffi:mem-ref varid :int))
    ))


(defun copy-array (array cffi-pointer &optional (type :int))
  (loop for e across array
     for i from 0
     do
       (setf (cffi:mem-aref cffi-pointer type i)
	     (aref array i))))


(defun put-var-int (cdf var-name data)
  (cffi:with-foreign-objects ((cdata :int (first (array-dimensions data))))
    (nc:copy-array data cdata)
    (nc-c:put-var-int (id cdf) (get-variable cdf var-name)
		      cdata)))

(defun put-var-double (cdf var-name data)
  (cffi:with-foreign-objects ((cdata :double (first (array-dimensions data))))
    (nc:copy-array data cdata :double)
    (nc-c:put-var-double (id cdf) (get-variable cdf var-name)
			 cdata)))

(defun put-vara-int (cdf var-name start count data)
  (cffi:with-foreign-objects ((cdata :int (first (array-dimensions data)))
			      (ccount :int (first (array-dimensions count)))
			      (cstart :int (first (array-dimensions start))))
    (nc:copy-array data cdata)
    (nc:copy-array start cstart)
    (nc:copy-array count ccount)
    (nc-c:put-vara-int (id cdf) (get-variable cdf var-name)
		       cstart
		       ccount
		       cdata)))

(defun put-vara-double (cdf var-name start count data)
  (cffi:with-foreign-objects ((cdata :double (first (array-dimensions data)))
			      (ccount :int (first (array-dimensions count)))
			      (cstart :int (first (array-dimensions start))))
    (nc:copy-array data cdata :double)
    (nc:copy-array start cstart)
    (nc:copy-array count ccount)
    (nc-c:put-vara-double (id cdf) (get-variable cdf var-name)
		       cstart
		       ccount
		       cdata)))

(defun put-att-text (cdf var-name attribut value)
  (nc-c:put-att-text (id cdf) (get-variable cdf var-name) attribut (cffi-sys:make-pointer (length value)) value))


(defun enddef (cdf)
  (nc-c:enddef (id cdf)))

(defun nc-close (cdf)
  (nc-c:close (id cdf)))




(defun triangulate (pointlist)
  (cffi:with-foreign-objects ((in 'tri-c:triangulateio)
			      (out 'tri-c:triangulateio)
			      (vor 'tri-c:triangulateio)
			      (ptlist :double (array-total-size pointlist)))
    (setf (cffi:foreign-slot-value in 'tri-c:triangulateio 'tri-c:numberofpoints) (/ (array-total-size pointlist) 2))
    (setf (cffi:foreign-slot-value in 'tri-c:triangulateio 'tri-c:numberofsegments) 0)
    (setf (cffi:foreign-slot-value in 'tri-c:triangulateio 'tri-c:numberofholes) 0)
    (setf (cffi:foreign-slot-value in 'tri-c:triangulateio 'tri-c:numberofregions) 0)
    (copy-array pointlist  ptlist :double)
    (setf (cffi:foreign-slot-value in 'tri-c:triangulateio 'tri-c:pointlist) ptlist)

    (setf (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:edgelist) (cffi-sys:null-pointer))
    (setf (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:edgemarkerlist) (cffi-sys:null-pointer))
    (setf (cffi:foreign-slot-value vor 'tri-c:triangulateio 'tri-c:numberofpoints) 0)

    (tri-c:triangulate "z" in out vor)


    (let* ((nvertices (* (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:numberofcorners)
			 (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:numberoftriangles)))
	   (vertices (make-array nvertices)))

    ;; (format T "corner:~a triangle:~a ~a~%"
    ;; 	    (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:numberofcorners)
    ;; 	    (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:numberoftriangles)
    ;; 	    nvertices)

      (dotimes (i nvertices)
	(setf (aref vertices i) (cffi:mem-aref (cffi:foreign-slot-value out 'tri-c:triangulateio 'tri-c:trianglelist) :int i))
	)
      vertices)
    ))
