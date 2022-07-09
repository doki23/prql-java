#!/bin/bash

PROJECT_DIR=$1
echo PROJECT_DIR="${PROJECT_DIR}"
CONTEXT_PATH=$(pwd)
echo CONTEXT_PATH="${CONTEXT_PATH}"
cd "${PROJECT_DIR}" || exit 1

# install cross
cargo install cross

# x86_64-unknown-linux-gnu
echo "compiling for x86_64-unknown-linux-gnu"
rustup target add x86_64-unknown-linux-gnu
cross build --release --target x86_64-unknown-linux-gnu
ls -la target/x86_64-unknown-linux-gnu/release
cp -f target/x86_64-unknown-linux-gnu/release/libprql4j.so java/src/main/resources/libprql4j-linux64.so

## x86_64-unknown-linux-musl
#echo "compiling for x86_64-unknown-linux-musl"
#rustup target add x86_64-unknown-linux-musl
#cross build --release --target x86_64-unknown-linux-musl
#ls -la target/x86_64-unknown-linux-musl/release
#cp target/x86_64-unknown-linux-musl/release/libprql4j.so java/src/main/resources/libprql4j-linux64-musl.so

## x86_64-apple-darwin
#echo "compiling for x86_64-apple-darwin"
#rustup target add x86_64-apple-darwin
#cross build --release --target x86_64-apple-darwin
#ls -la target/x86_64-apple-darwin/release
#cp target/x86_64-apple-darwin/release/libprql4j.dylib java/src/main/resources/libprql4j-osx-x86_64.dylib

# x86_64-pc-windows-gnu
echo "compiling for x86_64-pc-windows-gnu"
rustup target add x86_64-pc-windows-gnu
cross build --release --target x86_64-pc-windows-gnu
ls -la target/x86_64-pc-windows-gnu/release
cp -f target/x86_64-pc-windows-gnu/release/prql4j.dll java/src/main/resources/libprql4j-win64.dll

# aarch64-unknown-linux-gnu
echo "compiling for aarch64-unknown-linux-gnu"
rustup target add aarch64-unknown-linux-gnu
cross build --release --target aarch64-unknown-linux-gnu
ls -la target/x86_64-unknown-linux-gnu/release
cp -f target/x86_64-unknown-linux-gnu/release/libprql4j.so java/src/main/resources/libprql4j-linux-aarch64.so

# aarch64-unknown-linux-musl
#echo "compiling for aarch64-unknown-linux-musl"
#rustup target add aarch64-unknown-linux-musl
#cross build --release --target aarch64-unknown-linux-musl
#ls -la target/aarch64-unknown-linux-musl/release
#cp -f target/aarch64-unknown-linux-musl/release/libprql4j.so java/src/main/resources/libprql4j-linux-aarch64-musl.so

## aarch64-apple-darwin
#echo "compiling for aarch64-apple-darwin"
#rustup target add aarch64-apple-darwin
#cross build --release --target aarch64-apple-darwin
#ls -la target/x86_64-apple-darwin/release
#cp -f target/x86_64-apple-darwin/release/libprql4j.dylib java/src/main/resources/libprql4j-osx-arm64.dylib

cd "${CONTEXT_PATH}" || exit 1