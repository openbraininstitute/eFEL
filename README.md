<img src="https://raw.githubusercontent.com/openbraininstitute/eFEL/master/docs/source/logo/eFELBanner.png" alt="eFEL banner" />

<table>
<tr>
  <td>Latest Release</td>
  <td>
    <a href="https://pypi.org/project/efel/">
    <img src="https://img.shields.io/pypi/v/efel.svg" alt="latest release" />
    </a>
  </td>
</tr>
<tr>
  <td>Documentation</td>
  <td>
    <a href="https://efel.readthedocs.io/">
    <img src="https://readthedocs.org/projects/efel/badge/?version=latest" alt="latest documentation" />
    </a>
  </td>
</tr>
<tr>
  <td>License</td>
  <td>
    <a href="https://github.com/openbraininstitute/efel/blob/master/LICENSE.txt">
    <img src="https://img.shields.io/pypi/l/efel.svg" alt="license" />
    </a>
</td>
</tr>
<tr>
  <td>Build Status</td>
  <td>
    <a href="https://github.com/openbraininstitute/eFEL/actions">
    <img src="https://github.com/openbraininstitute/eFEL/workflows/Publish/badge.svg" alt="actions build status" />
    </a>
  </td>
</tr>
<tr>
  <td>Coverage</td>
  <td>
    <a href="https://codecov.io/gh/openbraininstitute/efel">
    <img src="https://codecov.io/github/openbraininstitute/eFEL/coverage.svg?branch=master" alt="coverage" />
    </a>
  </td>
</tr>
<tr>
    <td>Gitter</td>
    <td>
        <a href="https://gitter.im/openbraininstitute/efel">
        <img src="https://badges.gitter.im/Join%20Chat.svg" />
    </a>
    </td>
</tr>
<tr>
    <td>Citation</td>
    <td>
        <a href="https://doi.org/10.1093/bioinformatics/btag328">
        <img src="https://img.shields.io/badge/DOI-10.1093%2Fbioinformatics%2Fbtag328-blue" alt="DOI"/>
    </a>
    </td>
</tr>
</table>

Introduction
============

eFEL is an electrophysiology feature extraction library that allows neuroscientists
to automatically extract features from time series data recorded from neurons
(both in vitro and in silico).
Examples are the action potential width and amplitude in voltage traces recorded
during whole-cell patch clamp experiments.
The user of the library provides a set of traces and selects the features to
be calculated. The library will then extract the requested features and return
the values to the user.

The core of the library is written in C++, and a Python wrapper is included.
At the moment we provide a way to automatically compile and install the library
as a Python module. Instructions on how to compile the eFEL as a standalone C++
library can be found [here](https://efel.readthedocs.io/en/latest/installation.html#installing-the-c-standalone-library).

How to cite
===========
When you use this eFEL software for your research, we ask you to cite it (this includes poster presentations) by referring to the following paper:

```text
Mandge, D., Tuncel, A., Jaquier, A., Kilic, I., Damart, T., Markram, H., Van Geit, W., & Ranjan, R. (2026). eFEL: Electrophysiology feature extraction library. Bioinformatics, 42(6). https://doi.org/10.1093/bioinformatics/btag328
```

<details>
<summary><strong>BibTeX</strong></summary>

```bibtex
@article{10.1093/bioinformatics/btag328,
    author = {Mandge, Darshan and Tuncel, Anıl and Jaquier, Aurélien and Kilic, Ilkan and Damart, Tanguy and Markram, Henry and Van Geit, Werner and Ranjan, Rajnish},
    title = {eFEL: electrophysiology feature extraction library},
    journal = {Bioinformatics},
    volume = {42},
    number = {6},
    pages = {btag328},
    year = {2026},
    month = {06},
    issn = {1367-4811},
    doi = {10.1093/bioinformatics/btag328},
    url = {https://doi.org/10.1093/bioinformatics/btag328},
}
```

</details>

If you want to cite a particular version of eFEL, you can find the DOIs of all versions at: https://doi.org/10.5281/zenodo.19604220

**Note**: The earlier versions of code can be found in the Blue Brain Project eFEL : https://github.com/BlueBrain/eFEL, Zenodo: https://doi.org/10.5281/zenodo.14222078 and PyPI: https://pypi.org/project/efel/#history repositories.

Requirements
============

* [Python 3.10+](https://www.python.org/downloads/)
* [Pip](https://pip.pypa.io)
* A C++17 compiler that can be used by pip when a source build is required
* Runtime dependencies (NumPy, Neo, SciPy, and typing-extensions) are installed automatically by pip
* The instructions below assume access to a command shell on Linux / UNIX / macOS / Cygwin

Installation
============

The easiest way to install eFEL is to use [pip](https://pip.pypa.io)

```bash
python -m pip install efel
```

Or you could use a [Python virtual environment](https://docs.python.org/3/library/venv.html)

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install efel
```

If you want to install straight from the GitHub repository, you can use:

```bash
python -m pip install git+https://github.com/openbraininstitute/eFEL.git
```

Quick Start
===========

First you need to import the module

```python
import efel
```

To get a list with all the available feature names

```python
efel.get_feature_names()
```

Note that the extra-cellular features, the bpap_attenuation feature and the check_ais_initiation feature are not listed above because they have to be used in a special way, as described [here](https://github.com/openbraininstitute/eFEL/blob/master/examples/extracellular/extrafeats_example.ipynb) for extra-cellular features, [here](https://github.com/openbraininstitute/eFEL/blob/master/docs/source/eFeatures.rst#bpap_attenuation) for bpap_attenuation feature and [here](https://github.com/openbraininstitute/eFEL/blob/master/docs/source/eFeatures.rst#check_ais_initiation) for check_ais_initiation feature.

To change the spike detection threshold setting (default is -20 mV)

```python
efel.set_setting('Threshold', -30)
```
For a full list of available settings, please refer to the [Setting class](./efel/settings.py)

The python function to extract features is get_feature_values(...).
Below is a short example on how to use this function. The code and example
trace are available
[here](https://github.com/openbraininstitute/eFEL/blob/master/examples/basic/basic_example1.py)

```python
"""Basic example 1 for eFEL"""

import efel
import numpy

def main():
    """Main"""

    # Use numpy to read the trace data from the txt file
    data = numpy.loadtxt('example_trace1.txt')

    # Time is the first column
    time = data[:, 0]
    # Voltage is the second column
    voltage = data[:, 1]

    # Now we will construct the datastructure that will be passed to eFEL

    # A 'trace' is a dictionary
    trace1 = {}

    # Set the 'T' (=time) key of the trace
    trace1['T'] = time

    # Set the 'V' (=voltage) key of the trace
    trace1['V'] = voltage

    # Set the 'stim_start' (time at which a stimulus starts, in ms)
    # key of the trace
    # Warning: this need to be a list (with one element)
    trace1['stim_start'] = [700]

    # Set the 'stim_end' (time at which a stimulus end) key of the trace
    # Warning: this need to be a list (with one element)
    trace1['stim_end'] = [2700]

    # Multiple traces can be passed to the eFEL at the same time, so the
    # argument should be a list
    traces = [trace1]

    # set the threshold for spike detection to -20 mV
    efel.set_setting('Threshold', -20)

    # Now we pass 'traces' to the efel and ask it to calculate the feature
    # values
    traces_results = efel.get_feature_values(traces,
                                           ['AP_amplitude', 'voltage_base'])

    # The return value is a list of trace_results, every trace_results
    # corresponds to one trace in the 'traces' list above (in same order)
    for trace_results in traces_results:
        # trace_result is a dictionary, with as keys the requested features
        for feature_name, feature_values in trace_results.items():
            print("Feature %s has the following values: %s" %
                (feature_name, ', '.join([str(x) for x in feature_values])))


if __name__ == '__main__':
    main()
```

The output of this example is
```
Feature AP_amplitude has the following values: 72.5782441262, 46.3672552618, 41.1546679158, 39.7631750953, 36.1614653031, 37.8489295737
Feature voltage_base has the following values: -75.446665721
```
This means that the eFEL found 5 action potentials in the voltage trace. The
amplitudes of these APs are the result of the 'AP_amplitude' feature.
The voltage before the start of the stimulus is measured by 'voltage_base'.
Results are in mV.

Full documentation
==================
The full documentation can be found [here](https://efel.readthedocs.io)

Funding
=======
This work has been partially funded by the European Union Seventh Framework Program (FP7/2007­2013) under grant agreement no. 604102 (HBP),
the European Union’s Horizon 2020 Framework Programme for Research and Innovation under the Specific Grant Agreement No. 720270, 785907
(Human Brain Project SGA1/SGA2) and by the EBRAINS research infrastructure, funded from the European Union’s Horizon 2020 Framework
Programme for Research and Innovation under the Specific Grant Agreement No. 945539 (Human Brain Project SGA3).
This project/research was supported by funding to the Blue Brain Project, a research center of the École polytechnique fédérale de
Lausanne (EPFL), from the Swiss government’s ETH Board of the Swiss Federal Institutes of Technology.

Copyright (c) 2009-2024 Blue Brain Project/EPFL

Copyright (c) 2025-2026 Open Brain Institute
