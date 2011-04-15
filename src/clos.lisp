(in-package :netcdf)


(cl:defclass netcdf ()
  ((id :initarg :id :accessor id)
   (dimensions :initform (cl:make-hash-table :test 'cl:equal))
   (variables :initform (cl:make-hash-table :test 'cl:equal))
   ))

(cl:defun put-dimension (netcdf name id)
  (cl:setf (cl:gethash name (cl:slot-value netcdf 'dimensions)) id))

(cl:defun get-dimension (netcdf name)
  (cl:multiple-value-bind (valeur trouve)
      (cl:gethash name (cl:slot-value netcdf 'dimensions))
    (cl:if trouve
	valeur
	(cl:error "%a non trouve dans les dimmensions" name)
	)))
