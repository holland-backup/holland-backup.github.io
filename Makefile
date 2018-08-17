# Minimal makefile for Sphinx documentation
#
SOURCEDIR     = _sources
BUILDDIR      = _build
SPHINXOPTS    =

# You can declare the SPHINXBUILD command or you can let the Makefile
# try to find one
SPHINXBUILD =

# If you're declaring a SPHINXBUILD command make sure you included the
# correct build arguments
SPHINXTYPEARG =

ifndef SPHINXBUILD
    SPHINXBUILD_Test   := $(shell command -v sphinx-build-3 2>>/dev/null )
    ifdef SPHINXBUILD_Test
        SPHINXBUILD = sphinx-build-3
        SPHINXTYPEARG = '-M'
	endif
    SPHINXBUILD_Test := $(shell command -v sphinx-1.0-build 2>>/dev/null )
    ifdef SPHINXBUILD_Test
        SPHINXBUILD = sphinx-1.0-build
	    SPHINXTYPEARG = '-b'
    else
        SPHINXBUILD = sphinx-build
        SPHINXTYPEARG = '-b'
    endif
endif

ifndef SPHINXTYPEARG
    $(error SPHINXTYPEARG is not set)
endif


# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) $(SPHINXTYPEARG) $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

