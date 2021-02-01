class DunePdelabAT27 < Formula
  option "with-support-dune-copasi-v0.3", "Support for dune-copasi v0.3"
  desc "Packaging for dune-pdelab: a toolbox for solving PDEs -- discretization module"
  homepage "https://gitlab.dune-project.org"

  if build.with? "support-dune-copasi-v0.3"
    url "https://gitlab.dune-project.org/copasi/dune-pdelab/-/archive/dune-copasi-v0.3/dune-pdelab-dune-copasi-v0.3.tar.gz"
    sha256 "27e842896eb916c2725388014260676f1188cb2c041a6eb79e54965b1dfc0e29"
    depends_on "dune-copasi/tap/dune-typetree@2.7" => "with-support-dune-copasi-v0.3"
    depends_on "dune-copasi/tap/dune-functions@2.7" => "with-support-dune-copasi-v0.3"
  else
    # TODO: reference from tag otherwise checksum may change!
    url "https://gitlab.dune-project.org/pdelab/dune-pdelab/-/archive/releases/2.7/dune-pdelab-releases-2.7.tar.gz"
    sha256 "e0d82fa43c744bcab0f486e69f421553f3329771cd1162bd738831e148ead1e2"
    depends_on "dune-typetree@2.7"
    depends_on "dune-functions@2.7"
  end
  # license any_of: [
  #   "GPL-2.0-only" => { with: "DUNE-exception" },
  #   "LGPL-3.0-or-later"
  # ]

  depends_on "dune-istl@2.7"
  depends_on "eigen"

  def install
    system "cmake", "-DBUILD_SHARED_LIBS=1", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
