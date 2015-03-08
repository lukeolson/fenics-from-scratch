require 'formula'

class Ffc < Formula
  homepage 'https://bitbucket.org/fenics-project/ffc'
  url 'https://bitbucket.org/fenics-project/ffc/downloads/ffc-1.5.0.tar.gz'
  sha1 'fcecefdf24af38f7df49007ed08de4447fa9d83f'
  depends_on :python
  depends_on 'numpy' => :python
  depends_on 'swig'
  depends_on 'ufl'

  patch :DATA

  def install
    ENV.deparallelize

    system 'python', 'setup.py', 'install', "--prefix=#{prefix}"
  end
end
