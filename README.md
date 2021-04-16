# homebrew-cli

Private brew tap for installing the CLI

## Steps

Pre-Reqs: A github private access token. make sure that the scope include `repo: Full control of private repositories`

```
# set HOMEBREW_GITHUB_API_TOKEN to the created token
$ export HOMEBREW_GITHUB_API_TOKEN=ghp_...

# Add the private repository to brew tap
$ brew tap aardlabs/cli

# Install pruney
$ brew install pruney
```

## Notes

[1] ReAdding private repo feature [gist](https://gist.github.com/minamijoyo/3d8aa79085369efb79964ba45e24bb0e)

[2] Discussion on brew private repo [gist](https://gist.github.com/mlafeldt/8e7d50ee0b1de44e256d)

[3] Blog article on creating private brew [tap](https://www.prodops.io/blog/creating-homebrew-taps-for-private-internal-tools)

