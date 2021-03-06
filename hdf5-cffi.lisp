;;;; Copyright by The HDF Group.                                              
;;;; All rights reserved.
;;;;
;;;; This file is part of hdf5-cffi.
;;;; The full hdf5-cffi copyright notice, including terms governing
;;;; use, modification, and redistribution, is contained in the file COPYING,
;;;; which can be found at the root of the source code distribution tree.
;;;; If you do not have access to this file, you may request a copy from
;;;; help@hdfgroup.org.

(in-package :hdf5)

(progn
  (defparameter +NULL+ (cffi:null-pointer))
  (pushnew :hdf5 *features*)
  (defvar *hdf5-header-file* "hdf5.h")
  (cffi:define-foreign-library
      libhdf5
    (:darwin (:default "libhdf5"))
    (t (:default "libhdf5")))
  (cffi:define-foreign-library
      libhdf5-hl
    (t (:default "libhdf5_hl")))
  (defun load-hdf5-foreign-libraries ()
    (cffi:use-foreign-library libhdf5)
    (cffi:use-foreign-library libhdf5-hl)))
