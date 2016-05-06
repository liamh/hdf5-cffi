;;; H5IM interface for images
;;; By Liam Healy

;;; H5IM interface for images, in the "high level" HDF5 library
;;; See https://www.hdfgroup.org/HDF5/doc_resource/doc181/HL/

(in-package #:hdf5)

;;; Header files /usr/include/hdf5/serial/hdf5_hl.h
;;; Library is libhdf5_hl.so.

(cffi:defcfun "H5IMmake_image_8bit" herr-t
  "https://www.hdfgroup.org/HDF5/doc/HL/RM_H5IM.html#H5IMmake_image_8bit"
  (loc-id hid-t)
  (dset-name :string)
  (width hsize-t)
  (height hsize-t)
  (buf-ptr :pointer))

(cffi:defcfun "H5IMmake_image_24bit" herr-t
  "https://www.hdfgroup.org/HDF5/doc/HL/RM_H5IM.html#H5IMmake_image_24bit"
  (loc-id hid-t)
  (dset-name :string)
  (width hsize-t)
  (height hsize-t)
  (buf-ptr :pointer))

(cffi:defcfun "H5IMget_image_info" herr-t
  "https://www.hdfgroup.org/HDF5/doc/HL/RM_H5IM.html#H5IMget_image_info"
  (loc-id hid-t)
  (dset-name :string)
  (width hsize-t)
  (height hsize-t)
  (planes :pointer)
  (interlace :string)
  (npals :pointer))

(cffi:defcfun "H5IMread_image" herr-t
  "https://www.hdfgroup.org/HDF5/doc/HL/RM_H5IM.html#H5IMread_image"
  (loc-id hid-t)
  (dset-name :string)
  (buf-ptr :pointer))

(cffi:defcfun "H5IMmake_palette" herr-t
  "https://www.hdfgroup.org/HDF5/doc/HL/RM_H5IM.html#H5IMmake_palette"
  (loc-id hid-t)
  (pal-name :string)
  (pal-dims :pointer)
  (pal-data :pointer))

(cffi:defcfun "H5IMlink_palette"  herr-t
  (loc-id hid-t)
  (image-name :string)
  (pal-name :string))

(cffi:defcfun "H5IMunlink_palette" herr-t
  (loc-id hid-t)
  (image-name :string)
  (pal-name :string))

(cffi:defcfun "H5IMget_npalettes" herr-t
  (loc-id hid-t)
  (image-name :string)
  (npals hssize-t))

(cffi:defcfun "H5IMget_palette_info" herr-t
  (loc-id hid-t)
  (image-name :string)
  (pal-number :int)
  (pal-dims :pointer))

(cffi:defcfun "H5IMget_palette" herr-t
  (loc-id hid-t)
  (image-name :string)
  (pal-number :int)
  (pal-data :pointer))

(cffi:defcfun "H5IMis_image" herr-t
  (loc-id hid-t)
  (dset-name :string))

(cffi:defcfun "H5IMis_palette" herr-t
  (loc-id hid-t)
  (dset-name :string))
