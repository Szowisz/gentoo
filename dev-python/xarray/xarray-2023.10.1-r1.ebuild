# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 multiprocessing pypi

DESCRIPTION="N-D labeled arrays and datasets in Python"
HOMEPAGE="
	https://xarray.pydata.org/
	https://github.com/pydata/xarray/
	https://pypi.org/project/xarray/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv ~x86"

RDEPEND="
	>=dev-python/numpy-1.22[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.4[${PYTHON_USEDEP}]
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
"
# note: most of the test dependencies are optional
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/bottleneck[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/toolz[${PYTHON_USEDEP}]
		!hppa? ( >=dev-python/scipy-1.4[${PYTHON_USEDEP}] )
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# warning-targeted tests are fragile and not important to end users
	xarray/tests/test_backends.py::test_no_warning_from_dask_effective_get
	# TODO: segv in netcdf4-python
	'xarray/tests/test_backends.py::test_open_mfdataset_manyfiles[netcdf4-20-True-5-5]'
	'xarray/tests/test_backends.py::test_open_mfdataset_manyfiles[netcdf4-20-True-5-None]'
	'xarray/tests/test_backends.py::test_open_mfdataset_manyfiles[netcdf4-20-True-None-5]'
	'xarray/tests/test_backends.py::test_open_mfdataset_manyfiles[netcdf4-20-True-None-None]'
	xarray/tests/test_backends.py::TestDask::test_save_mfdataset_compute_false_roundtrip
	# hangs
	xarray/tests/test_backends.py::TestDask::test_dask_roundtrip
	# mismatches when pyarrow is installed
	# https://github.com/pydata/xarray/issues/8092
	xarray/tests/test_dask.py::TestToDaskDataFrame::test_to_dask_dataframe_2D
	xarray/tests/test_dask.py::TestToDaskDataFrame::test_to_dask_dataframe_not_daskarray
)

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest -p xdist.plugin -n "$(makeopts_jobs)" --dist=worksteal
}
