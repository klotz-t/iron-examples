echo "This build script is intended for use on hazelhen!"

# dynamic linkage
export CRAYPE_LINK_TYPE=dynamic

# path to iron installation
export OPENCMISS_INSTALL_DIR=/lustre/cray/ws8/ws/icbbnmai-iron/install

# load modules
module restore /lustre/cray/ws8/ws/icbbnmai-iron/manage_gcc/build_release/gcc49

# cmake
ccc
# standard cmake build
cmake -DCMAKE_BUILD_TYPE=RELEASE -DOPENCMISS_BUILD_TYPE=RELEASE -DMPI_HOME=$MPICH_DIR -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=CC -DCMAKE_Fortran_COMPILER=ftn -DPETSC_DIR=$PETSC_DIR ..
make clean
make all
echo "Build of cuboid finished successfully!"
cp cuboid ~/ws/ws8/icbbnmai-ws_april/course/ && echo "Copied cuboid to ~/ws/ws8/icbbnmai-ws_april/course/"

# building with manually linking (disabled)
#cmake -DCMAKE_BUILD_TYPE=RELEASE -DOPENCMISS_BUILD_TYPE=RELEASE -DEVIL=1 -DMPI_HOME=$MPICH_DIR -DCMAKE_C_COMPILER=cc -DCMAKE_CXX_COMPILER=CC -DCMAKE_Fortran_COMPILER=ftn -DPETSC_DIR=$PETSC_DIR .. && echo "The following command will fail, this is OK!" && mk ; . link_gcc_5.1.sh && echo "Build of cuboid finished successfully!" && cp cuboid ~/ws/ws8/icbbnmai-ws_april/course/ && echo "Copied cuboid to ~/ws/ws8/icbbnmai-ws_april/course/"
