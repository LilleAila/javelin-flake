{
  stdenv,
  pico-sdk,
  cmake,
  gnumake,
  pkg-config,
  gcc-arm-embedded-13,
  python3,
  picotool,
  javelin-steno,
  javelin-steno-pico,

  emptyFile,
  javelin-config ? emptyFile,
}:
let
  pico-sdk' = pico-sdk.override { withSubmodules = true; };
in
stdenv.mkDerivation {
  name = "javelin-steno-pico";

  src = stdenv.mkDerivation {
    name = "javelin-steno-pico-src";
    src = javelin-steno-pico;
    buildPhase = ''
      mkdir -p $out
      cp -r ./* $out/
      mkdir -p $out/javelin
      cp -rs ${javelin-steno}/* $out/javelin/

      ln -s ${javelin-config} $out/config/javelin-flake.h
    '';
  };

  buildInputs = [
    pico-sdk'
    gcc-arm-embedded-13
  ];

  nativeBuildInputs = [
    cmake
    gnumake
    pkg-config
    python3
    picotool
  ];

  cmakeFlags = [
    "-DCMAKE_VERBOSE_MAKEFILE=ON"
    "-DJAVELIN_BOARD=javelin-flake"
    "-DPICO_SDK_PATH=${pico-sdk'}/lib/pico-sdk"
    "-DPICO_PLATFORM=rp2040"

    "-DCMAKE_C_COMPILER=${gcc-arm-embedded-13}/bin/arm-none-eabi-gcc"
    "-DCMAKE_CXX_COMPILER=${gcc-arm-embedded-13}/bin/arm-none-eabi-g++"
    "-DCMAKE_ASM_COMPILER=${gcc-arm-embedded-13}/bin/arm-none-eabi-gcc"
    "-DCMAKE_LINKER=${gcc-arm-embedded-13}/bin/arm-none-eabi-ld"

    "-DCMAKE_MODULE_PATH=${pico-sdk'}/lib/pico-sdk/external"
    "-DCMAKE_TOOLCHAIN_FILE=${pico-sdk'}/lib/pico-sdk/cmake/preload/toolchains/pico_arm_cortex_m0plus_gcc.cmake"
    "-DPICO_TOOLCHAIN_PATH=${gcc-arm-embedded-13}"

    "-DCMAKE_MAKE_PROGRAM=${gnumake}/bin/make"
    "-DPICOTOOL_PATH=${picotool}/bin/picotool"
    "-DPICOTOOL_EXECUTABLE=${picotool}/bin/picotool"
  ];

  preConfigure = ''
    export PICO_SDK_PATH="${pico-sdk'}/lib/pico-sdk"
    export PICO_TOOLCHAIN_PATH="${gcc-arm-embedded-13}"
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ./javelin-steno-pico.* $out/bin/
  '';
}
