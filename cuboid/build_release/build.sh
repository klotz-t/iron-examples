echo "This build script is intended for use on hazelhen!"

# dynamic linkage and path to iron installation
export CRAYPE_LINK_TYPE=dynamic
export OPENCMISS_INSTALL_DIR=/lustre/cray/ws8/ws/icbbnmai-iron/install

# load modules
module restore /lustre/cray/ws8/ws/icbbnmai-iron/manage_gcc/build_release/gcc49

# add path from tpsl module
if [[ $PATH != *"$CRAY_TPSL_PREFIX_DIR"* ]]; then
  export PATH=$PATH:$CRAY_TPSL_PREFIX_DIR
fi

# add path from libsci module
if [[ $PATH != *"$CRAY_LIBSCI_PREFIX_DIR"* ]]; then
  export PATH=$PATH:$CRAY_LIBSCI_PREFIX_DIR
fi

# add path to HDF5
if [[ $PATH != *"$HDF5_DIR"* ]]; then
  export PATH=$PATH:$HDF5_DIR
fi

# add path to PETSC_DIR
petsc_path=$PETSC_DIR/lib
if [[ $PATH != *"$petsc_path"* ]]; then
  export PATH=$PATH:$petsc_path
fi

# cmake
#ccc
# standard cmake build
time cmake -DCMAKE_BUILD_TYPE=RELEASE -DOPENCMISS_BUILD_TYPE=RELEASE -DMPI_HOME=$MPICH_DIR -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=CC -DCMAKE_Fortran_COMPILER=ftn -DPETSC_DIR=$PETSC_DIR ..

#make clean
time make all && echo "Build of cuboid finished successfully!"
cp cuboid ~/ws/ws8/icbbnmai-ws_april/course/ && echo "Copied cuboid to ~/ws/ws8/icbbnmai-ws_april/course/"

# building with manually linking (disabled)
#cmake -DCMAKE_BUILD_TYPE=RELEASE -DOPENCMISS_BUILD_TYPE=RELEASE -DEVIL=1 -DMPI_HOME=$MPICH_DIR -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=CC -DCMAKE_Fortran_COMPILER=ftn -DPETSC_DIR=$PETSC_DIR .. && echo "The following command will fail, this is OK!" && mk ; . link_gcc_5.1.sh && echo "Build of cuboid finished successfully!" && cp cuboid ~/ws/ws8/icbbnmai-ws_april/course/ && echo "Copied cuboid to ~/ws/ws8/icbbnmai-ws_april/course/"
