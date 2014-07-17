# itertools2

The R package `itertools2` is a port of [Python's excellent itertools
module](https://docs.python.org/2/library/itertools.html) to R for efficient
looping and is a replacement for the existing [itertools R
package](https://r-forge.r-project.org/projects/itertools/).

## Installation

You can install the stable version on [CRAN](http://cran.r-project.org/package=itertools2):

```r
install.packages('itertools2', dependencies=TRUE)
```

If you prefer to download the latest version, instead run the following after
installing [devtools](https://github.com/hadley/devtools):

```r
devtools::install_github('ramhiser/itertools2')
```

## License

The `itertools2` R package is licensed under the [MIT
License](http://opensource.org/licenses/MIT). However, this package depends on the [iterators R
package](http://cran.r-project.org/web/packages/iterators/index.html),
which is licensed under the [Apache License, Version
2.0](http://www.apache.org/licenses/LICENSE-2.0). Both packages are freely
available for commercial and non-commerical usage. Please consult the licensing
terms for more details.
