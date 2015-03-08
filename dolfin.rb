require 'formula'

class Dolfin < Formula
  homepage 'https://bitbucket.org/fenics-project/dolfin'
  url 'https://bitbucket.org/fenics-project/dolfin/downloads/dolfin-1.5.0.tar.gz'
  sha1 'f7556d62985608e4124948ce2bfe63b35609ca13'

  depends_on :fortran
  depends_on :python
  depends_on 'numpy' => :python
  depends_on 'ply' => :python

  depends_on 'eigen' => :build
  depends_on 'cmake' => :build
  depends_on 'cppunit' => :build
  depends_on 'pkg-config' => :build
  depends_on 'swig' => :build
  depends_on :mpi => [:cc, :cxx, :f90, :recommended]
  depends_on 'petsc' => :build
  depends_on 'boost' => ['without-single', 'with-mpi'] if build.with? :mpi
  depends_on 'vtk' => ['--with-qt']

  #if build.without? :mpi
  #  depends_on 'boost' => ['--without-single']
  #end

  depends_on 'ffc'
  depends_on 'ufl'
  depends_on 'uflacs'
  depends_on 'fiat'
  depends_on 'instant'

  def install
    ENV.deparallelize
    ENV["PETSC_DIR"] = Formula["petsc"].opt_prefix
    ENV["PETSC_ARCH"] = "real"
    ENV['PARMETIS_DIR'] = Formula['parmetis'].prefix
    ENV['AMD_DIR'] = Formula['suite-sparse'].prefix
    ENV['CHOLMOD_DIR'] = Formula['suite-sparse'].prefix
    ENV['UMFPACK_DIR'] = Formula['suite-sparse'].prefix

    # ENV['SLEPC_DIR'] = Formula.factory('slepc').prefix
    # ENV['TAO_DIR'] = Formula['tao'].prefix
    # ENV['SCOTCH_DIR'] = Formula.factory('scotch').prefix
    # ENV['PASTIX_DIR'] = Formula.factory('pastix').prefix
    # ENV['CPPUNIT_DIR'] = Formula.factory('cppunit').prefix
    # ENV.append_to_cflags '-frounding-math'

    mkdir 'build' do
      system 'cmake', '..', *std_cmake_args
      system 'make'
      system 'make', 'install'
    end
  end

  def caveats; <<-EOS
    do not source dolfin.conf, as the DYLIB settings conflict with Homebrew.
    EOS
  end
end
