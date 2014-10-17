# Building #

Make sure you have cloned the moonshine repository. Make sure branches
match across repositories (`hac` and `hac`, for example).

Then execute the following steps:

1. `cabal sandbox init`
2. `cabal sandbox add-source <moonshine repo path>`
3. `cabal install -j --only-dependencies`
4. `cabal build`

If Step 3 fails with an error like "cabal: The following packages are
likely to be broken by the reinstalls..." then try:

* `cabal install -j --only-dependencies --force-reinstalls`

On way or the other, the compiled executable will be in

* `./dist/build/sunrise/sunrise`
