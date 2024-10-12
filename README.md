# Git Credential Pass
Git Credential Pass is a secure, lightweight [git credential helper][git-credential-helper] for Unix based on [Pass][pass].

# Prerequisites

An initialized `pass` for the user. (with the cumbersome setup of gnu-pg and gpg-agent)

# Usage

Terminology: We use the word identity as a technical term referring to `$protocol/[$username@]$host` (the username@ part is optional), basically the identity of authorization: how, who is to be authorized at which git host.

In order to set up credentials for an identity one has to
1. set up secrets in pass. Each secret must be placed on the path `$SECRET_PATH/$identity/$name`,
where `$SECRET_PATH` is defined in the script itself. (defaults to git-credentials-pass), `$identity` as above, and $name
is the name of the secret, as the git authorization requires it (typically username, password).
2. Add the identity to global `.gitconfig`:
```
[credential "$identity"]
        helper = pass -s password -s username
```
This section may override the username in identity, like here.
```
[credential "$host"]
        username = token
        helper = pass -s password
```
The required secret may depends from the host and the authorization method.
Examples:
  GitHub https PAT authorization requires the PAT as username and a blank password
  However, GitLab https PAT authorization requires only a password, username can be anything (tested with token)

## License

Git Credential Pass is licensed under the [MIT License][git-credential-pass-license].

[git-credential-helper]: https://git-scm.com/docs/gitcredentials
[git-credential-pass-license]: LICENSE
[pass]: https://www.passwordstore.org/
