require 'formula'

class Fiat < Formula
  homepage 'https://bitbucket.org/fenics-project/fiat'
  url 'https://bitbucket.org/fenics-project/fiat/downloads/fiat-1.5.0.tar.gz'
  sha1 '50c5e1909108a4750e351b4824f1828e83cf8a4a'

  depends_on :python
  depends_on 'numpy' => :python

  #resource('scientificpython') do
  #  url 'https://sourcesup.renater.fr/frs/download.php/4153/ScientificPython-2.9.2.tar.gz'
  #  sha1 '387b0ed5600b0f08301412745aab2da72e1459d7'
  #end

  def install
    ENV.deparallelize

    #resourceargs = ['setup.py', 'install', "--prefix=#{prefix}"]
    #resource('scientificpython').stage {system 'python', *resourceargs }

    system 'python', 'setup.py', 'install', "--prefix=#{prefix}"
  end
end
