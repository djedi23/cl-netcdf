 (in-package :netcdf)


(cl:defclass netcdf ()
  ((id :initarg :id :accessor id)
   (dimensions :initform (cl:make-hash-table))
   (variables :initform (cl:make-hash-table))
   ))

(cl:defun put-dimension (netcdf name id)
  (cl:setf (cl:gethash name (cl:slot-value netcdf 'dimensions)) id))

(cl:defun get-dimension (netcdf name)
  (cl:gethash name (cl:slot-value netcdf 'dimensions)))
