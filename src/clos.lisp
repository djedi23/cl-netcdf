(defpackage :netcdf
  (:nicknames :nc)
  (:use :cl))
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
