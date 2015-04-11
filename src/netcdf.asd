;; -*- coding: utf-8; -*-
(defpackage :netcdf-asdf
  (:use :asdf))

(in-package :netcdf-asdf)

(defsystem "netcdf"
  :description ""
  :author       "Valvassori Moïse <moise@valvassori.org>"
  :licence "None"
  :depends-on (:cffi)
  :components (
	       (:file "netcdf")
	       (:file "triangle")
	       (:file "clos" :depends-on ("netcdf" "triangle"))
	       ))
