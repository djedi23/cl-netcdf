(defpackage :netcdf
  (:nicknames :nc)
  (:use :cl)
  (:export
   nc-close
   create
   def-dim
   enddef))
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

(defun enddef (cdf)
  (nc-c:enddef (id cdf)))

(defun nc-close (cdf)
  (nc-c:close (id cdf)))
