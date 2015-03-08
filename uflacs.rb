require 'formula'

class Uflacs < Formula
  homepage 'https://bitbucket.org/fenics-project/ufl'
  url 'https://bitbucket.org/fenics-project/uflacs/downloads/uflacs-1.5.0.tar.gz'
  sha1 '6b21db6e8ebc335408ceb4b5ae27dc0eb1cbc4da'

  depends_on :python
  depends_on 'numpy' => :python

  def install
    ENV.deparallelize

    system 'python', 'setup.py', 'install', "--prefix=#{prefix}"
  end
end
