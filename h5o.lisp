;;;; Copyright by The HDF Group.                                              
;;;; All rights reserved.
;;;;
;;;; This file is part of hdf5-cffi.
;;;; The full hdf5-cffi copyright notice, including terms governing
;;;; use, modification, and redistribution, is contained in the file COPYING,
;;;; which can be found at the root of the source code distribution tree.
;;;; If you do not have access to this file, you may request a copy from
;;;; help@hdfgroup.org.

(in-package #:hdf5)

(cffi:defcstruct _space-t
  (total hsize-t)
  (meta hsize-t)
  (mesg hsize-t)
  (free hsize-t))

(cffi:defcstruct _mesg-t
  (present :uint64)
  (shared :uint64))

(cffi:defcstruct H5O-hdr-info-t
  (version :unsigned-int)
  (nmesgs :unsigned-int)
  (nchunks :unsigned-int)
  (flags :unsigned-int)
  (space (:struct _space-t))
  (mesg (:struct _mesg-t)))

(cffi:defcstruct _meta-t
  (obj (:struct H5-ih-info-t))
  (attr (:struct H5-ih-info-t)))

(cffi:defcstruct H5O-info-t
  (fileno :unsigned-long)
  (addr haddr-t)
  (type H5O-type-t)
  (rc :unsigned-int)
  (atime time-t)
  (mtime time-t)
  (ctime time-t)
  (btime time-t)
  (num-attrs hsize-t)
  (hdr (:struct H5O-hdr-info-t))
  (meta-size (:struct _meta-t)))

(cffi:defcfun "H5Oclose" herr-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-Close"
  (object-id hid-t))

(cffi:defcfun "H5Ocopy" herr-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-Copy"
  (src-loc-id hid-t)
  (src-name :string)
  (dst-loc-id hid-t)
  (dst-name :string)
  (ocpypl-id hid-t)
  (lcpl-id hid-t))

(cffi:defcfun "H5Oexists_by_name" htri-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-ExistsByName"
  (loc-id hid-t)
  (name :string)
  (lapl-id hid-t))

(cffi:defcfun "H5Oget_info" herr-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-GetInfo"
  (object-id hid-t)
  (object-info (:pointer (:struct H5O-info-t))))

(cffi:defcfun "H5Oget_info_by_name" herr-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-GetInfoByName"
  (loc-id hid-t)
  (object-name :string)
  (object-info (:pointer (:struct H5O-info-t)))
  (lapl-id hid-t))

(cffi:defcfun "H5Olink" herr-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-Link"
  (object-id hid-t)
  (new-loc-id hid-t)
  (new-link-name :string)
  (lcpl hid-t)
  (lapl hid-t))

(cffi:defcfun "H5Oopen" hid-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-Open"
  (loc-id hid-t)
  (name :string)
  (lapl-id hid-t))

(cffi:defcfun "H5Ovisit" herr-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-Visit"
  (object-id hid-t)
  (index-type H5-index-t)
  (order H5-iter-order-t)
  (op :pointer)
  (op-data :pointer))
