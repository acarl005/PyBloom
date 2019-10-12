from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import os


long_description = open(os.path.join(os.path.dirname(__file__), "README.md")).read()

setup(name="PyBloom",
      description="Bloom filter C extension",
      long_description=long_description,
      version="0.1.0",
      packages=["pybloom"],
      ext_modules=cythonize([Extension("pybloom", ["pybloom/pybloom.pyx", "pybloom/murmurhash.c", "pybloom/bloom.c"])]),
      author="Andrew Carlson",
      author_email="acarl005@g.ucla.edu",
      url="https://github.com/acarl005/PyBloom",
      classifiers=["Intended Audience :: Developers",
                   "Intended Audience :: Education",
                   "Intended Audience :: Science/Research",
                   "License :: OSI Approved :: MIT License",
                   "Programming Language :: C",
                   "Programming Language :: Python",
                   "Topic :: Scientific/Engineering :: Mathematics"])
