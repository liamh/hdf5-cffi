;;;; Copyright by The HDF Group.                                              
;;;; All rights reserved.
;;;;
;;;; This file is part of hdf5-cffi.
;;;; The full hdf5-cffi copyright notice, including terms governing
;;;; use, modification, and redistribution, is contained in the file COPYING,
;;;; which can be found at the root of the source code distribution tree.
;;;; If you do not have access to this file, you may request a copy from
;;;; help@hdfgroup.org.

(include "H5Rpublic.h")

(in-package :hdf5)

(cenum H5R-type-t
       ((:H5R-BADTYPE        "H5R_BADTYPE"))
       ((:H5R-OBJECT         "H5R_OBJECT"))
       ((:H5R-DATASET-REGION "H5R_DATASET_REGION"))
       ((:H5R-MAXTYPE        "H5R_MAXTYPE")))

(constant (+H5R-OBJ-REF-BUF-SIZE+  "H5R_OBJ_REF_BUF_SIZE"))

(constant (+H5R-DSET-REG-REF-BUF-SIZE+  "H5R_DSET_REG_REF_BUF_SIZE"))
