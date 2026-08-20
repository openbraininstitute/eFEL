all: install
install: clean
	python -m build --sdist
	python -m pip install dist/efel-*.tar.gz --upgrade
virtualenv: clean
	python -m venv pyenv
	@echo "Activate the environment with: . pyenv/bin/activate"
doc: install
	python -m pip install -r requirements_docs.txt
	$(MAKE) -C docs clean
	$(MAKE) -C docs html SPHINXOPTS=-W
doc_upload: doc
	cd docs/build/html && \
	touch .nojekyll && \
	git init . && \
	git add . && \
	git commit -m "Updating docs" && \
	git push "git@github.com:openbraininstitute/eFEL.git" master:gh-pages --force && \
	rm -rf .git
update_version:
	cd efel && \
	python -c 'import version; version._get_version_number()' && \
	git add GITHASH.txt && \
	git add VERSION.txt && \
	git commit -m 'Updated version number'
pypi:
	python -m pip install build twine --upgrade
	rm -rf dist
	python -m build
	python -m twine upload dist/*
clean:
	rm -f tests/log/fllog.txt
	rm -f fllog.txt
	rm -rf build_cmake
	rm -rf build
	rm -rf docs/build
	rm -rf dist
	rm -rf pyenv
cpp:
	cmake -S . -B build_cmake && \
	cmake --build build_cmake --parallel
test:
	tox -e py3-test
push: clean install test doc doc_upload
	git push
	git push --tags
format:	
	clang-format -i -style="google" efel/cppcore/*.cpp
graph:
	pip install pygraphviz==1.11
	python utils/efel_graph_dependency.py -i efel/DependencyV5.txt --graph dependencies.png --graph-deps
