

`mkdir build/Release && cd build/Release`
`../../../cmake-3.20.0-linux-x86_64/bin/cmake -DCMAKE_BUILD_TYPE=Release -DPARLAY_CILK=1 -DPARLAY_BENCHMARK=On -DCMAKE_CXX_COMPILER=$CXX -DCMAKE_CXX_FLAGS_RELEASE="-O3 -DNDEBUG -DPARLAY_CILK=1 -fopencilk" -DCMAKE_CXX_LINKER_FLAGS="-fopencilk" ../..`

make sure to download cmake 3.20
