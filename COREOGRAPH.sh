if [ $# -eq 0 ]; then
    OPENSSL="../openssl/openssl-install"
else
    OPENSSL=$1
fi

echo "Taking OpenSSL source dir: $OPENSSL"

rm -rf build
S2N_LIBCRYPTO=openssl-3.0 cmake . -Bbuild -DBUILD_SHARED_LIBS=on -DSEARCH_LIBCRYPTO=false -DCMAKE_PREFIX_PATH=$OPENSSL
cmake --build build --config Release -j $(nproc)

