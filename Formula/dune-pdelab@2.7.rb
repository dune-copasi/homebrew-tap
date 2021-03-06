require File.expand_path(File.dirname(__FILE__) + '/dune-common@2.7.rb')

class DunePdelabAT27 < Formula
  desc "Packaging for dune-pdelab: a toolbox for solving PDEs -- discretization module"
  homepage "https://gitlab.dune-project.org"

  url "https://gitlab.dune-project.org/pdelab/dune-pdelab/-/archive/3435f7f1f4d05e3f6e8d9fe8a06a09569c7244be/dune-pdelab-3435f7f1f4d05e3f6e8d9fe8a06a09569c7244be.tar.gz"
  sha256 "5d13e15bf0e8ae7855586c46d786c33a794f031a3317fcbc87dff2fa25ad3a14"

  license any_of: [
    { "GPL-2.0-only" => { with: "DUNE-exception" } },
    "LGPL-3.0-or-later"
  ]

  depends_on "dune-typetree@2.7"
  depends_on "dune-functions@2.7"
  depends_on "dune-istl@2.7"
  depends_on "eigen"

  def install
    system "cmake", ".", *std_cmake_args, *DuneCommonAT27.cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
