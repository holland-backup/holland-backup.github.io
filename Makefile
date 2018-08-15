# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD_Test   := $(shell command -v sphinx-build-3 2>>/dev/null )
ifdef SPHINXBUILD_Test
    SPHINXBUILD = sphinx-build-3
    SPHINXTYPEARG = '-M'
else
    SPHINXBUILD = sphinx-build
    SPHINXTYPEARG = '-b'
endif
SPHINXPROJ    = docs.hollandbackup.org
SOURCEDIR     = _sources
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) $(SPHINXTYPEARG) $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

