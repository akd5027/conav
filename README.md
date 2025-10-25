# Conav

A code-navigation utility.

Currently supports Header switching and splitting for C++ via
`:ToggleSourceHeader` and `:SplitSourceHeader`. Additionally the utility
functions `:FileSearch` does a `ctrl+p`-like search from your working directory
while `:FileSearchCurrent` does a `ctrl+p`-like search relative to the active
buffer.

## Dependencies

This plugin requires the following ViM Plugin:

* `akd5027/fpop.git`

and as a result also requires the CLI utility:

`fzf`
