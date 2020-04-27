```
     _       _    __ _ _           
  __| | ___ | |_ / _(_) | ___  ___ 
 / _` |/ _ \| __| |_| | |/ _ \/ __|
| (_| | (_) | |_|  _| | |  __/\__ \
 \__,_|\___/ \__|_| |_|_|\___||___/
```

Managed with [chezmoi](https://github.com/twpayne/chezmoi).
                                   
## Initialize


`chezmoi init https://github.com/kirecek/dotfiles --apply`

## Packages

To also istall GUI and packages, use ansible playbook located in ansible subdirectory.

```
$ ansible-playbook playbook.yaml
```