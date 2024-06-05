# Juliantools

Various utilities.

## Tools

### `git/git-history.pl`

List git branch history from reflog, and jump to specific entry.

**Usage:**

```bash
# List recently visited branches
$ git-history.pl
1 first-branch
2 second-branch
3 third-branch

# Jump to "second-branch", labeled by index "2"
$ git-history.pl 2
Switched to branch 'second-branch'
```

**Note:** The `master` branch is ignored, and the max number of branches listed is specified in the script (default 30).

**Protip:** Alias the script to something easy to type, e.g. `å` for very quick branch jumping!

```bash
$ å
1 first-branch
2 second-branch
3 third-branch

$ å 3
Switched to branch 'third-branch'
```


### Test

Here's a dummy key:
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c