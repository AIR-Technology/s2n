# build s2n-tls
cmake . -Bbuild \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=on
cmake --build build -j $(nproc)
CTEST_PARALLEL_LEVEL=$(nproc) ctest --test-dir build
cmake --install build
