.. eFEL documentation master file, created by
   sphinx-quickstart on Mon May 11 14:40:15 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Electrophys Feature Extraction Library
======================================
The Electrophys Feature Extract Library (eFEL) allows neuroscientists to
automatically extract eFeatures from time series data recorded from neurons
(both in vitro and in silico). Examples are the action potential width and
amplitude in voltage traces recorded during whole-cell patch clamp experiments.
The user of the library provides a set of traces and selects the eFeatures to be
calculated. The library will then extract the requested eFeatures and return the
values to the user.

The core of the library is written in C++, and a Python wrapper is included.
You can automatically compile and install the library as a Python module.

The source code of the eFEL is located on github:
`openbraininstitute/eFEL <https://github.com/openbraininstitute/eFEL>`_

How to cite
-----------
When you use this eFEL software for your research, we ask you to cite it (this
includes poster presentations) by referring to the following paper:

Darshan Mandge, Anıl Tuncel, Aurélien Jaquier, Ilkan Kilic, Tanguy Damart,
Henry Markram, Werner Van Geit, Rajnish Ranjan, eFEL: Electrophysiology Feature
Extraction Library, Bioinformatics, 2026;, btag328,
https://doi.org/10.1093/bioinformatics/btag328

.. code-block:: bibtex

    @article{10.1093/bioinformatics/btag328,
        author = {Mandge, Darshan and Tuncel, Anıl and Jaquier, Aurélien and Kilic, Ilkan and Damart, Tanguy and Markram, Henry and Van Geit, Werner and Ranjan, Rajnish},
        title = {eFEL: Electrophysiology Feature Extraction Library},
        journal = {Bioinformatics},
        pages = {btag328},
        year = {2026},
        month = {05},
        issn = {1367-4811},
        doi = {10.1093/bioinformatics/btag328},
        url = {https://doi.org/10.1093/bioinformatics/btag328},
    }

If you want to cite a particular version of eFEL, you can find the DOIs of all
versions at: https://doi.org/10.5281/zenodo.19604220

.. toctree::
   :maxdepth: 3

   installation
   examples
   eFeatures
   api
   changelog
   developers

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

