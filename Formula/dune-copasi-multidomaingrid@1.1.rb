require File.expand_path(File.dirname(__FILE__) + '/dune-common@2.7.rb')

class DuneCopasiMultidomaingridAT11 < Formula
  desc "Packaging for dune-multidomaingrid: a toolbox for solving PDEs -- convert grids into multidomain grids"
  homepage "https://gitlab.dune-project.org"

  url "https://gitlab.dune-project.org/extensions/dune-multidomaingrid.git",
    using:    :git,
    tag:      "v2.7.1",
    revision: "cd5679974fe1c91b56e74022e95f01b1d2018c3b"

  license any_of: [
    { "GPL-2.0-only" => { with: "DUNE-exception" } },
    "LGPL-3.0-or-later"
  ]

  depends_on "dune-common@2.7"
  depends_on "dune-copasi-typetree@1.1"
  depends_on "dune-grid@2.7"


  conflicts_with "dune-multidomaingrid"
  conflicts_with "dune-multidomaingrid@2.7"
  conflicts_with "dune-copasi-multidomaingrid@1.0"

  def install
    system "cmake", ".", *std_cmake_args, *DuneCommonAT27.cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
