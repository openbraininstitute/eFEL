Installation
============

Requirements
------------
* `Python 3.10+ <https://www.python.org/downloads/>`_
* `Pip <https://pip.pypa.io>`_
* Runtime dependencies (NumPy, Neo, SciPy, and typing-extensions) are installed automatically by pip
* A C++17 compiler when pip needs to build from source
* `CMake 3.12+ <https://cmake.org/download/>`_ and a C++17 compiler for the standalone library
* The instructions below assume access to a command shell on Linux / UNIX / macOS / Cygwin

Installation using pip
----------------------

The easiest way to install eFEL is to use `pip <https://pip.pypa.io>`_::

    python -m pip install efel

Or create a `Python virtual environment <https://docs.python.org/3/library/venv.html>`_::

    python -m venv .venv
    . .venv/bin/activate
    python -m pip install efel

To install the latest source directly from GitHub::

    python -m pip install git+https://github.com/openbraininstitute/eFEL.git

Installing the C++ standalone library
-------------------------------------

If your system does not have it, install `CMake <https://cmake.org/download/>`_ 3.12
or newer and make sure a C++17 compiler is available.

Configure a new build directory, replacing ``YOURINSTALLDIR`` with the directory
where you want to install the eFEL library (for example, ``/usr/local``)::

    cmake -S . -B build_cmake -DCMAKE_INSTALL_PREFIX=YOURINSTALLDIR

Build and install the library::

    cmake --build build_cmake --parallel
    cmake --install build_cmake

On Linux, the installed libraries are ``libefel.a`` and ``libefel.so``. On macOS,
the shared library is named ``libefel.dylib`` instead of ``libefel.so``.
