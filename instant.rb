require 'formula'

class Instant < Formula
  homepage 'https://bitbucket.org/fenics-project/instant'
  url 'https://bitbucket.org/fenics-project/instant/downloads/instant-1.5.0.tar.gz'
  sha1 'e76656b4a698e2d7295acc51ff3a0505f62db68c'

  depends_on 'swig'
  depends_on :python
  depends_on 'numpy' => :python

  def install
    ENV.deparallelize

    system 'python', 'setup.py', 'install', "--prefix=#{prefix}"
  end
end
