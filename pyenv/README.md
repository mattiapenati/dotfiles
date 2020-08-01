### Known issues

Installing Python through `pyenv` can fail with the error:

```sh
...
ModuleNotFoundError: No module named 'pyexpat'
```

The isssue is solved reinstalling XCode CLI tools:

```sh
sudo rm -rf /Library/Developer/CommandLineTools
xcode-select --install
```
