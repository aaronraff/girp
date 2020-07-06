# Girp

Girp is a mash-up of the words "**gi**t" and "g**r**e**p**". It is a Vim plugin that is a wrapper around `git grep`. Girp allows you to easily run `git grep` from within Vim and it populates the quickfix list for you.

### Installation

Using [Vundle](https://github.com/VundleVim/Vundle.vim):

```
Plugin 'aaronraff/girp'
```

### Usage
Just use it like you would `git grep`! It just calls `git grep -n ...` under the hood.

```
:Girp My-Search-Term
:Girp -i my-search-term
```
