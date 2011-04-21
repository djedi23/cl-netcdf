;;; This file was automatically generated by SWIG (http://www.swig.org).
;;; Version 2.0.1
;;;
;;; Do not make changes to this file unless you know what you are doing--modify
;;; the SWIG interface file instead.

 (defpackage :triangle-cffi
        (:nicknames :tri-c)
	(:use :cffi))
 (in-package :triangle-cffi)

 (define-foreign-library libtriangle
    (:unix "libtriangle.so")
    (t (:default "libtriangle")))

 (use-foreign-library libtriangle)




;;;SWIG wrapper code starts here

(cl:defmacro defanonenum (&body enums)
   "Converts anonymous enums to defconstants."
  `(cl:progn ,@(cl:loop for value in enums
                        for index = 0 then (cl:1+ index)
                        when (cl:listp value) do (cl:setf index (cl:second value)
                                                          value (cl:first value))
                        collect `(cl:defconstant ,value ,index))))

(cl:eval-when (:compile-toplevel :load-toplevel)
  (cl:unless (cl:fboundp 'swig-lispify)
    (cl:defun swig-lispify (name flag cl:&optional (package cl:*package*))
      (cl:labels ((helper (lst last rest cl:&aux (c (cl:car lst)))
                    (cl:cond
                      ((cl:null lst)
                       rest)
                      ((cl:upper-case-p c)
                       (helper (cl:cdr lst) 'upper
                               (cl:case last
                                 ((lower digit) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:lower-case-p c)
                       (helper (cl:cdr lst) 'lower (cl:cons (cl:char-upcase c) rest)))
                      ((cl:digit-char-p c)
                       (helper (cl:cdr lst) 'digit 
                               (cl:case last
                                 ((upper lower) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:char-equal c #\_)
                       (helper (cl:cdr lst) '_ (cl:cons #\- rest)))
                      (cl:t
                       (cl:error "Invalid character: ~A" c)))))
        (cl:let ((fix (cl:case flag
                        ((constant enumvalue) "+")
                        (variable "*")
                        (cl:t ""))))
          (cl:intern
           (cl:concatenate
            'cl:string
            fix
            (cl:nreverse (helper (cl:concatenate 'cl:list name) cl:nil cl:nil))
            fix)
           package))))))

;;;SWIG wrapper code ends here


(cffi:defcstruct #.(swig-lispify "triangulateio" 'classname)
	(#.(swig-lispify "pointlist" 'slotname) :pointer)
	(#.(swig-lispify "pointattributelist" 'slotname) :pointer)
	(#.(swig-lispify "pointmarkerlist" 'slotname) :pointer)
	(#.(swig-lispify "numberofpoints" 'slotname) :int)
	(#.(swig-lispify "numberofpointattributes" 'slotname) :int)
	(#.(swig-lispify "trianglelist" 'slotname) :pointer)
	(#.(swig-lispify "triangleattributelist" 'slotname) :pointer)
	(#.(swig-lispify "trianglearealist" 'slotname) :pointer)
	(#.(swig-lispify "neighborlist" 'slotname) :pointer)
	(#.(swig-lispify "numberoftriangles" 'slotname) :int)
	(#.(swig-lispify "numberofcorners" 'slotname) :int)
	(#.(swig-lispify "numberoftriangleattributes" 'slotname) :int)
	(#.(swig-lispify "segmentlist" 'slotname) :pointer)
	(#.(swig-lispify "segmentmarkerlist" 'slotname) :pointer)
	(#.(swig-lispify "numberofsegments" 'slotname) :int)
	(#.(swig-lispify "holelist" 'slotname) :pointer)
	(#.(swig-lispify "numberofholes" 'slotname) :int)
	(#.(swig-lispify "regionlist" 'slotname) :pointer)
	(#.(swig-lispify "numberofregions" 'slotname) :int)
	(#.(swig-lispify "edgelist" 'slotname) :pointer)
	(#.(swig-lispify "edgemarkerlist" 'slotname) :pointer)
	(#.(swig-lispify "normlist" 'slotname) :pointer)
	(#.(swig-lispify "numberofedges" 'slotname) :int))

(cl:export '#.(swig-lispify "triangulateio" 'classname))

(cl:export '#.(swig-lispify "pointlist" 'slotname))

(cl:export '#.(swig-lispify "pointattributelist" 'slotname))

(cl:export '#.(swig-lispify "pointmarkerlist" 'slotname))

(cl:export '#.(swig-lispify "numberofpoints" 'slotname))

(cl:export '#.(swig-lispify "numberofpointattributes" 'slotname))

(cl:export '#.(swig-lispify "trianglelist" 'slotname))

(cl:export '#.(swig-lispify "triangleattributelist" 'slotname))

(cl:export '#.(swig-lispify "trianglearealist" 'slotname))

(cl:export '#.(swig-lispify "neighborlist" 'slotname))

(cl:export '#.(swig-lispify "numberoftriangles" 'slotname))

(cl:export '#.(swig-lispify "numberofcorners" 'slotname))

(cl:export '#.(swig-lispify "numberoftriangleattributes" 'slotname))

(cl:export '#.(swig-lispify "segmentlist" 'slotname))

(cl:export '#.(swig-lispify "segmentmarkerlist" 'slotname))

(cl:export '#.(swig-lispify "numberofsegments" 'slotname))

(cl:export '#.(swig-lispify "holelist" 'slotname))

(cl:export '#.(swig-lispify "numberofholes" 'slotname))

(cl:export '#.(swig-lispify "regionlist" 'slotname))

(cl:export '#.(swig-lispify "numberofregions" 'slotname))

(cl:export '#.(swig-lispify "edgelist" 'slotname))

(cl:export '#.(swig-lispify "edgemarkerlist" 'slotname))

(cl:export '#.(swig-lispify "normlist" 'slotname))

(cl:export '#.(swig-lispify "numberofedges" 'slotname))

(cffi:defcfun ("triangulate" #.(swig-lispify "triangulate" 'function)) :void
  (arg0 :string)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cl:export '#.(swig-lispify "triangulate" 'function))

(cffi:defcfun ("trifree" #.(swig-lispify "trifree" 'function)) :void
  (memptr :pointer))

(cl:export '#.(swig-lispify "trifree" 'function))

(cl:defconstant #.(swig-lispify "INPUTVERTEX" 'constant) 0)

(cl:export '#.(swig-lispify "INPUTVERTEX" 'constant))

(cl:defconstant #.(swig-lispify "SEGMENTVERTEX" 'constant) 1)

(cl:export '#.(swig-lispify "SEGMENTVERTEX" 'constant))

(cl:defconstant #.(swig-lispify "FREEVERTEX" 'constant) 2)

(cl:export '#.(swig-lispify "FREEVERTEX" 'constant))

(cl:defconstant #.(swig-lispify "DEADVERTEX" 'constant) -32768)

(cl:export '#.(swig-lispify "DEADVERTEX" 'constant))

(cl:defconstant #.(swig-lispify "UNDEADVERTEX" 'constant) -32767)

(cl:export '#.(swig-lispify "UNDEADVERTEX" 'constant))

(cl:defconstant #.(swig-lispify "FILENAMESIZE" 'constant) 2048)

(cl:export '#.(swig-lispify "FILENAMESIZE" 'constant))

(cffi:defcenum #.(swig-lispify "insertvertexresult" 'enumname)
	#.(swig-lispify "SUCCESSFULVERTEX" 'enumvalue :keyword)
	#.(swig-lispify "ENCROACHINGVERTEX" 'enumvalue :keyword)
	#.(swig-lispify "VIOLATINGVERTEX" 'enumvalue :keyword)
	#.(swig-lispify "DUPLICATEVERTEX" 'enumvalue :keyword))

(cl:export '#.(swig-lispify "insertvertexresult" 'enumname))

(cffi:defcstruct #.(swig-lispify "otri" 'classname)
	(#.(swig-lispify "tri" 'slotname) :pointer)
	(#.(swig-lispify "orient" 'slotname) :int))

(cl:export '#.(swig-lispify "otri" 'classname))

(cl:export '#.(swig-lispify "tri" 'slotname))

(cl:export '#.(swig-lispify "orient" 'slotname))

(cffi:defcstruct #.(swig-lispify "osub" 'classname)
	(#.(swig-lispify "ss" 'slotname) :pointer)
	(#.(swig-lispify "ssorient" 'slotname) :int))

(cl:export '#.(swig-lispify "osub" 'classname))

(cl:export '#.(swig-lispify "ss" 'slotname))

(cl:export '#.(swig-lispify "ssorient" 'slotname))

(cffi:defcstruct #.(swig-lispify "badsubseg" 'classname)
	(#.(swig-lispify "encsubseg" 'slotname) :pointer)
	(#.(swig-lispify "subsegorg" 'slotname) :pointer)
	(#.(swig-lispify "subsegdest" 'slotname) :pointer))

(cl:export '#.(swig-lispify "badsubseg" 'classname))

(cl:export '#.(swig-lispify "encsubseg" 'slotname))

(cl:export '#.(swig-lispify "subsegorg" 'slotname))

(cl:export '#.(swig-lispify "subsegdest" 'slotname))

(cffi:defcstruct #.(swig-lispify "badtriang" 'classname)
	(#.(swig-lispify "poortri" 'slotname) :pointer)
	(#.(swig-lispify "key" 'slotname) :double)
	(#.(swig-lispify "triangorg" 'slotname) :pointer)
	(#.(swig-lispify "triangdest" 'slotname) :pointer)
	(#.(swig-lispify "triangapex" 'slotname) :pointer)
	(#.(swig-lispify "nexttriang" 'slotname) :pointer))

(cl:export '#.(swig-lispify "badtriang" 'classname))

(cl:export '#.(swig-lispify "poortri" 'slotname))

(cl:export '#.(swig-lispify "key" 'slotname))

(cl:export '#.(swig-lispify "triangorg" 'slotname))

(cl:export '#.(swig-lispify "triangdest" 'slotname))

(cl:export '#.(swig-lispify "triangapex" 'slotname))

(cl:export '#.(swig-lispify "nexttriang" 'slotname))

(cffi:defcstruct #.(swig-lispify "flipstacker" 'classname)
	(#.(swig-lispify "flippedtri" 'slotname) :pointer)
	(#.(swig-lispify "prevflip" 'slotname) :pointer))

(cl:export '#.(swig-lispify "flipstacker" 'classname))

(cl:export '#.(swig-lispify "flippedtri" 'slotname))

(cl:export '#.(swig-lispify "prevflip" 'slotname))

(cffi:defcstruct #.(swig-lispify "event" 'classname)
	(#.(swig-lispify "xkey" 'slotname) :double)
	(#.(swig-lispify "ykey" 'slotname) :double)
	(#.(swig-lispify "eventptr" 'slotname) :pointer)
	(#.(swig-lispify "heapposition" 'slotname) :int))

(cl:export '#.(swig-lispify "event" 'classname))

(cl:export '#.(swig-lispify "xkey" 'slotname))

(cl:export '#.(swig-lispify "ykey" 'slotname))

(cl:export '#.(swig-lispify "eventptr" 'slotname))

(cl:export '#.(swig-lispify "heapposition" 'slotname))

(cffi:defcstruct #.(swig-lispify "splaynode" 'classname)
	(#.(swig-lispify "keyedge" 'slotname) #.(swig-lispify "otri" 'classname))
	(#.(swig-lispify "keydest" 'slotname) :pointer)
	(#.(swig-lispify "lchild" 'slotname) :pointer)
	(#.(swig-lispify "rchild" 'slotname) :pointer))

(cl:export '#.(swig-lispify "splaynode" 'classname))

(cl:export '#.(swig-lispify "keyedge" 'slotname))

(cl:export '#.(swig-lispify "keydest" 'slotname))

(cl:export '#.(swig-lispify "lchild" 'slotname))

(cl:export '#.(swig-lispify "rchild" 'slotname))

(cffi:defcstruct #.(swig-lispify "memorypool" 'classname)
	(#.(swig-lispify "firstblock" 'slotname) :pointer)
	(#.(swig-lispify "nowblock" 'slotname) :pointer)
	(#.(swig-lispify "nextitem" 'slotname) :pointer)
	(#.(swig-lispify "deaditemstack" 'slotname) :pointer)
	(#.(swig-lispify "pathblock" 'slotname) :pointer)
	(#.(swig-lispify "pathitem" 'slotname) :pointer)
	(#.(swig-lispify "alignbytes" 'slotname) :int)
	(#.(swig-lispify "itembytes" 'slotname) :int)
	(#.(swig-lispify "itemsperblock" 'slotname) :int)
	(#.(swig-lispify "itemsfirstblock" 'slotname) :int)
	(#.(swig-lispify "items" 'slotname) :long)
	(#.(swig-lispify "maxitems" 'slotname) :long)
	(#.(swig-lispify "unallocateditems" 'slotname) :int)
	(#.(swig-lispify "pathitemsleft" 'slotname) :int))

(cl:export '#.(swig-lispify "memorypool" 'classname))

(cl:export '#.(swig-lispify "firstblock" 'slotname))

(cl:export '#.(swig-lispify "nowblock" 'slotname))

(cl:export '#.(swig-lispify "nextitem" 'slotname))

(cl:export '#.(swig-lispify "deaditemstack" 'slotname))

(cl:export '#.(swig-lispify "pathblock" 'slotname))

(cl:export '#.(swig-lispify "pathitem" 'slotname))

(cl:export '#.(swig-lispify "alignbytes" 'slotname))

(cl:export '#.(swig-lispify "itembytes" 'slotname))

(cl:export '#.(swig-lispify "itemsperblock" 'slotname))

(cl:export '#.(swig-lispify "itemsfirstblock" 'slotname))

(cl:export '#.(swig-lispify "items" 'slotname))

(cl:export '#.(swig-lispify "maxitems" 'slotname))

(cl:export '#.(swig-lispify "unallocateditems" 'slotname))

(cl:export '#.(swig-lispify "pathitemsleft" 'slotname))

(cffi:defcstruct #.(swig-lispify "mesh" 'classname)
	(#.(swig-lispify "triangles" 'slotname) #.(swig-lispify "memorypool" 'classname))
	(#.(swig-lispify "subsegs" 'slotname) #.(swig-lispify "memorypool" 'classname))
	(#.(swig-lispify "vertices" 'slotname) #.(swig-lispify "memorypool" 'classname))
	(#.(swig-lispify "viri" 'slotname) #.(swig-lispify "memorypool" 'classname))
	(#.(swig-lispify "badsubsegs" 'slotname) #.(swig-lispify "memorypool" 'classname))
	(#.(swig-lispify "badtriangles" 'slotname) #.(swig-lispify "memorypool" 'classname))
	(#.(swig-lispify "flipstackers" 'slotname) #.(swig-lispify "memorypool" 'classname))
	(#.(swig-lispify "splaynodes" 'slotname) #.(swig-lispify "memorypool" 'classname))
	(#.(swig-lispify "queuefront" 'slotname) :pointer)
	(#.(swig-lispify "queuetail" 'slotname) :pointer)
	(#.(swig-lispify "nextnonemptyq" 'slotname) :pointer)
	(#.(swig-lispify "firstnonemptyq" 'slotname) :int)
	(#.(swig-lispify "lastflip" 'slotname) :pointer)
	(#.(swig-lispify "xmin" 'slotname) :double)
	(#.(swig-lispify "xmax" 'slotname) :double)
	(#.(swig-lispify "ymin" 'slotname) :double)
	(#.(swig-lispify "ymax" 'slotname) :double)
	(#.(swig-lispify "xminextreme" 'slotname) :double)
	(#.(swig-lispify "invertices" 'slotname) :int)
	(#.(swig-lispify "inelements" 'slotname) :int)
	(#.(swig-lispify "insegments" 'slotname) :int)
	(#.(swig-lispify "holes" 'slotname) :int)
	(#.(swig-lispify "regions" 'slotname) :int)
	(#.(swig-lispify "undeads" 'slotname) :int)
	(#.(swig-lispify "edges" 'slotname) :long)
	(#.(swig-lispify "mesh_dim" 'slotname) :int)
	(#.(swig-lispify "nextras" 'slotname) :int)
	(#.(swig-lispify "eextras" 'slotname) :int)
	(#.(swig-lispify "hullsize" 'slotname) :long)
	(#.(swig-lispify "steinerleft" 'slotname) :int)
	(#.(swig-lispify "vertexmarkindex" 'slotname) :int)
	(#.(swig-lispify "vertex2triindex" 'slotname) :int)
	(#.(swig-lispify "highorderindex" 'slotname) :int)
	(#.(swig-lispify "elemattribindex" 'slotname) :int)
	(#.(swig-lispify "areaboundindex" 'slotname) :int)
	(#.(swig-lispify "checksegments" 'slotname) :int)
	(#.(swig-lispify "checkquality" 'slotname) :int)
	(#.(swig-lispify "readnodefile" 'slotname) :int)
	(#.(swig-lispify "samples" 'slotname) :long)
	(#.(swig-lispify "incirclecount" 'slotname) :long)
	(#.(swig-lispify "counterclockcount" 'slotname) :long)
	(#.(swig-lispify "orient3dcount" 'slotname) :long)
	(#.(swig-lispify "hyperbolacount" 'slotname) :long)
	(#.(swig-lispify "circumcentercount" 'slotname) :long)
	(#.(swig-lispify "circletopcount" 'slotname) :long)
	(#.(swig-lispify "infvertex1" 'slotname) :pointer)
	(#.(swig-lispify "infvertex2" 'slotname) :pointer)
	(#.(swig-lispify "infvertex3" 'slotname) :pointer)
	(#.(swig-lispify "dummytri" 'slotname) :pointer)
	(#.(swig-lispify "dummytribase" 'slotname) :pointer)
	(#.(swig-lispify "dummysub" 'slotname) :pointer)
	(#.(swig-lispify "dummysubbase" 'slotname) :pointer)
	(#.(swig-lispify "recenttri" 'slotname) #.(swig-lispify "otri" 'classname)))

(cl:export '#.(swig-lispify "mesh" 'classname))

(cl:export '#.(swig-lispify "triangles" 'slotname))

(cl:export '#.(swig-lispify "subsegs" 'slotname))

(cl:export '#.(swig-lispify "vertices" 'slotname))

(cl:export '#.(swig-lispify "viri" 'slotname))

(cl:export '#.(swig-lispify "badsubsegs" 'slotname))

(cl:export '#.(swig-lispify "badtriangles" 'slotname))

(cl:export '#.(swig-lispify "flipstackers" 'slotname))

(cl:export '#.(swig-lispify "splaynodes" 'slotname))

(cl:export '#.(swig-lispify "queuefront" 'slotname))

(cl:export '#.(swig-lispify "queuetail" 'slotname))

(cl:export '#.(swig-lispify "nextnonemptyq" 'slotname))

(cl:export '#.(swig-lispify "firstnonemptyq" 'slotname))

(cl:export '#.(swig-lispify "lastflip" 'slotname))

(cl:export '#.(swig-lispify "xmin" 'slotname))

(cl:export '#.(swig-lispify "xmax" 'slotname))

(cl:export '#.(swig-lispify "ymin" 'slotname))

(cl:export '#.(swig-lispify "ymax" 'slotname))

(cl:export '#.(swig-lispify "xminextreme" 'slotname))

(cl:export '#.(swig-lispify "invertices" 'slotname))

(cl:export '#.(swig-lispify "inelements" 'slotname))

(cl:export '#.(swig-lispify "insegments" 'slotname))

(cl:export '#.(swig-lispify "holes" 'slotname))

(cl:export '#.(swig-lispify "regions" 'slotname))

(cl:export '#.(swig-lispify "undeads" 'slotname))

(cl:export '#.(swig-lispify "edges" 'slotname))

(cl:export '#.(swig-lispify "mesh_dim" 'slotname))

(cl:export '#.(swig-lispify "nextras" 'slotname))

(cl:export '#.(swig-lispify "eextras" 'slotname))

(cl:export '#.(swig-lispify "hullsize" 'slotname))

(cl:export '#.(swig-lispify "steinerleft" 'slotname))

(cl:export '#.(swig-lispify "vertexmarkindex" 'slotname))

(cl:export '#.(swig-lispify "vertex2triindex" 'slotname))

(cl:export '#.(swig-lispify "highorderindex" 'slotname))

(cl:export '#.(swig-lispify "elemattribindex" 'slotname))

(cl:export '#.(swig-lispify "areaboundindex" 'slotname))

(cl:export '#.(swig-lispify "checksegments" 'slotname))

(cl:export '#.(swig-lispify "checkquality" 'slotname))

(cl:export '#.(swig-lispify "readnodefile" 'slotname))

(cl:export '#.(swig-lispify "samples" 'slotname))

(cl:export '#.(swig-lispify "incirclecount" 'slotname))

(cl:export '#.(swig-lispify "counterclockcount" 'slotname))

(cl:export '#.(swig-lispify "orient3dcount" 'slotname))

(cl:export '#.(swig-lispify "hyperbolacount" 'slotname))

(cl:export '#.(swig-lispify "circumcentercount" 'slotname))

(cl:export '#.(swig-lispify "circletopcount" 'slotname))

(cl:export '#.(swig-lispify "infvertex1" 'slotname))

(cl:export '#.(swig-lispify "infvertex2" 'slotname))

(cl:export '#.(swig-lispify "infvertex3" 'slotname))

(cl:export '#.(swig-lispify "dummytri" 'slotname))

(cl:export '#.(swig-lispify "dummytribase" 'slotname))

(cl:export '#.(swig-lispify "dummysub" 'slotname))

(cl:export '#.(swig-lispify "dummysubbase" 'slotname))

(cl:export '#.(swig-lispify "recenttri" 'slotname))

(cffi:defcstruct #.(swig-lispify "behavior" 'classname)
	(#.(swig-lispify "poly" 'slotname) :int)
	(#.(swig-lispify "refine" 'slotname) :int)
	(#.(swig-lispify "quality" 'slotname) :int)
	(#.(swig-lispify "vararea" 'slotname) :int)
	(#.(swig-lispify "fixedarea" 'slotname) :int)
	(#.(swig-lispify "usertest" 'slotname) :int)
	(#.(swig-lispify "regionattrib" 'slotname) :int)
	(#.(swig-lispify "convex" 'slotname) :int)
	(#.(swig-lispify "weighted" 'slotname) :int)
	(#.(swig-lispify "jettison" 'slotname) :int)
	(#.(swig-lispify "firstnumber" 'slotname) :int)
	(#.(swig-lispify "edgesout" 'slotname) :int)
	(#.(swig-lispify "voronoi" 'slotname) :int)
	(#.(swig-lispify "neighbors" 'slotname) :int)
	(#.(swig-lispify "geomview" 'slotname) :int)
	(#.(swig-lispify "nobound" 'slotname) :int)
	(#.(swig-lispify "nopolywritten" 'slotname) :int)
	(#.(swig-lispify "nonodewritten" 'slotname) :int)
	(#.(swig-lispify "noelewritten" 'slotname) :int)
	(#.(swig-lispify "noiterationnum" 'slotname) :int)
	(#.(swig-lispify "noholes" 'slotname) :int)
	(#.(swig-lispify "noexact" 'slotname) :int)
	(#.(swig-lispify "conformdel" 'slotname) :int)
	(#.(swig-lispify "incremental" 'slotname) :int)
	(#.(swig-lispify "sweepline" 'slotname) :int)
	(#.(swig-lispify "dwyer" 'slotname) :int)
	(#.(swig-lispify "splitseg" 'slotname) :int)
	(#.(swig-lispify "docheck" 'slotname) :int)
	(#.(swig-lispify "quiet" 'slotname) :int)
	(#.(swig-lispify "verbose" 'slotname) :int)
	(#.(swig-lispify "usesegments" 'slotname) :int)
	(#.(swig-lispify "order" 'slotname) :int)
	(#.(swig-lispify "nobisect" 'slotname) :int)
	(#.(swig-lispify "steiner" 'slotname) :int)
	(#.(swig-lispify "minangle" 'slotname) :double)
	(#.(swig-lispify "goodangle" 'slotname) :double)
	(#.(swig-lispify "offconstant" 'slotname) :double)
	(#.(swig-lispify "maxarea" 'slotname) :double)
	(#.(swig-lispify "innodefilename" 'slotname) :pointer)
	(#.(swig-lispify "inelefilename" 'slotname) :pointer)
	(#.(swig-lispify "inpolyfilename" 'slotname) :pointer)
	(#.(swig-lispify "areafilename" 'slotname) :pointer)
	(#.(swig-lispify "outnodefilename" 'slotname) :pointer)
	(#.(swig-lispify "outelefilename" 'slotname) :pointer)
	(#.(swig-lispify "outpolyfilename" 'slotname) :pointer)
	(#.(swig-lispify "edgefilename" 'slotname) :pointer)
	(#.(swig-lispify "vnodefilename" 'slotname) :pointer)
	(#.(swig-lispify "vedgefilename" 'slotname) :pointer)
	(#.(swig-lispify "neighborfilename" 'slotname) :pointer)
	(#.(swig-lispify "offfilename" 'slotname) :pointer))

(cl:export '#.(swig-lispify "behavior" 'classname))

(cl:export '#.(swig-lispify "poly" 'slotname))

(cl:export '#.(swig-lispify "refine" 'slotname))

(cl:export '#.(swig-lispify "quality" 'slotname))

(cl:export '#.(swig-lispify "vararea" 'slotname))

(cl:export '#.(swig-lispify "fixedarea" 'slotname))

(cl:export '#.(swig-lispify "usertest" 'slotname))

(cl:export '#.(swig-lispify "regionattrib" 'slotname))

(cl:export '#.(swig-lispify "convex" 'slotname))

(cl:export '#.(swig-lispify "weighted" 'slotname))

(cl:export '#.(swig-lispify "jettison" 'slotname))

(cl:export '#.(swig-lispify "firstnumber" 'slotname))

(cl:export '#.(swig-lispify "edgesout" 'slotname))

(cl:export '#.(swig-lispify "voronoi" 'slotname))

(cl:export '#.(swig-lispify "neighbors" 'slotname))

(cl:export '#.(swig-lispify "geomview" 'slotname))

(cl:export '#.(swig-lispify "nobound" 'slotname))

(cl:export '#.(swig-lispify "nopolywritten" 'slotname))

(cl:export '#.(swig-lispify "nonodewritten" 'slotname))

(cl:export '#.(swig-lispify "noelewritten" 'slotname))

(cl:export '#.(swig-lispify "noiterationnum" 'slotname))

(cl:export '#.(swig-lispify "noholes" 'slotname))

(cl:export '#.(swig-lispify "noexact" 'slotname))

(cl:export '#.(swig-lispify "conformdel" 'slotname))

(cl:export '#.(swig-lispify "incremental" 'slotname))

(cl:export '#.(swig-lispify "sweepline" 'slotname))

(cl:export '#.(swig-lispify "dwyer" 'slotname))

(cl:export '#.(swig-lispify "splitseg" 'slotname))

(cl:export '#.(swig-lispify "docheck" 'slotname))

(cl:export '#.(swig-lispify "quiet" 'slotname))

(cl:export '#.(swig-lispify "verbose" 'slotname))

(cl:export '#.(swig-lispify "usesegments" 'slotname))

(cl:export '#.(swig-lispify "order" 'slotname))

(cl:export '#.(swig-lispify "nobisect" 'slotname))

(cl:export '#.(swig-lispify "steiner" 'slotname))

(cl:export '#.(swig-lispify "minangle" 'slotname))

(cl:export '#.(swig-lispify "goodangle" 'slotname))

(cl:export '#.(swig-lispify "offconstant" 'slotname))

(cl:export '#.(swig-lispify "maxarea" 'slotname))

(cl:export '#.(swig-lispify "innodefilename" 'slotname))

(cl:export '#.(swig-lispify "inelefilename" 'slotname))

(cl:export '#.(swig-lispify "inpolyfilename" 'slotname))

(cl:export '#.(swig-lispify "areafilename" 'slotname))

(cl:export '#.(swig-lispify "outnodefilename" 'slotname))

(cl:export '#.(swig-lispify "outelefilename" 'slotname))

(cl:export '#.(swig-lispify "outpolyfilename" 'slotname))

(cl:export '#.(swig-lispify "edgefilename" 'slotname))

(cl:export '#.(swig-lispify "vnodefilename" 'slotname))

(cl:export '#.(swig-lispify "vedgefilename" 'slotname))

(cl:export '#.(swig-lispify "neighborfilename" 'slotname))

(cl:export '#.(swig-lispify "offfilename" 'slotname))

(cffi:defcvar ("plus1mod3" #.(swig-lispify "plus1mod3" 'variable))
 :pointer)

(cl:export '#.(swig-lispify "plus1mod3" 'variable))

(cffi:defcvar ("minus1mod3" #.(swig-lispify "minus1mod3" 'variable))
 :pointer)

(cl:export '#.(swig-lispify "minus1mod3" 'variable))

(cffi:defcfun ("poolalloc" #.(swig-lispify "poolalloc" 'function)) :pointer
  (pool :pointer))

(cl:export '#.(swig-lispify "poolalloc" 'function))

(cffi:defcfun ("traversalinit" #.(swig-lispify "traversalinit" 'function)) :void
  (pool :pointer))

(cl:export '#.(swig-lispify "traversalinit" 'function))

(cffi:defcfun ("initializevertexpool" #.(swig-lispify "initializevertexpool" 'function)) :void
  (m :pointer)
  (b :pointer))

(cl:export '#.(swig-lispify "initializevertexpool" 'function))

(cffi:defcfun ("triangletraverse" #.(swig-lispify "triangletraverse" 'function)) :pointer
  (m :pointer))

(cl:export '#.(swig-lispify "triangletraverse" 'function))

(cffi:defcfun ("vertexdealloc" #.(swig-lispify "vertexdealloc" 'function)) :void
  (m :pointer)
  (dyingvertex :pointer))

(cl:export '#.(swig-lispify "vertexdealloc" 'function))

(cffi:defcfun ("vertextraverse" #.(swig-lispify "vertextraverse" 'function)) :pointer
  (m :pointer))

(cl:export '#.(swig-lispify "vertextraverse" 'function))

(cffi:defcfun ("getvertex" #.(swig-lispify "getvertex" 'function)) :pointer
  (m :pointer)
  (b :pointer)
  (number :int))

(cl:export '#.(swig-lispify "getvertex" 'function))

(cffi:defcfun ("triangledeinit" #.(swig-lispify "triangledeinit" 'function)) :void
  (m :pointer)
  (b :pointer))

(cl:export '#.(swig-lispify "triangledeinit" 'function))

(cffi:defcfun ("triangleinit" #.(swig-lispify "triangleinit" 'function)) :void
  (m :pointer))

(cl:export '#.(swig-lispify "triangleinit" 'function))

(cffi:defcfun ("makevertexmap" #.(swig-lispify "makevertexmap" 'function)) :void
  (m :pointer)
  (b :pointer))

(cl:export '#.(swig-lispify "makevertexmap" 'function))

(cffi:defcfun ("insertvertex" #.(swig-lispify "insertvertex" 'function)) #.(swig-lispify "insertvertexresult" 'enumname)
  (m :pointer)
  (b :pointer)
  (newvertex :pointer)
  (searchtri :pointer)
  (splitseg :pointer)
  (segmentflaws :int)
  (triflaws :int))

(cl:export '#.(swig-lispify "insertvertex" 'function))

(cffi:defcfun ("delaunay" #.(swig-lispify "delaunay" 'function)) :long
  (m :pointer)
  (b :pointer))

(cl:export '#.(swig-lispify "delaunay" 'function))

(cffi:defcfun ("insertsegment" #.(swig-lispify "insertsegment" 'function)) :void
  (m :pointer)
  (b :pointer)
  (endpoint1 :pointer)
  (endpoint2 :pointer)
  (newmark :int))

(cl:export '#.(swig-lispify "insertsegment" 'function))

(cffi:defcfun ("carveholes" #.(swig-lispify "carveholes" 'function)) :void
  (m :pointer)
  (b :pointer)
  (holelist :pointer)
  (holes :int)
  (regionlist :pointer)
  (regions :int))

(cl:export '#.(swig-lispify "carveholes" 'function))

(cffi:defcfun ("enforcequality" #.(swig-lispify "enforcequality" 'function)) :void
  (m :pointer)
  (b :pointer))

(cl:export '#.(swig-lispify "enforcequality" 'function))

