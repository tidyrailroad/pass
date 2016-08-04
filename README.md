# The pass application

The pass application is a simple password management system.
See https://www.passwordstore.org for a full description of the app.

The basic commands are

* generate
* insert
* show
* git

## generate
`pass generate [--no-symbols] $NAME ${LENGTH}`
For example `pass generate foo/bar 16` will generate a 16 digit password and store it in foo bar.

## insert
`pass insert`
For example, `pass insert foo/bar` will prompt you to insert a password to be stored in foo/bar.
You will be prompted again to confirm the password.

## show
`pass show foo/bar`
For example, `pass show foo/bar` will show the password stored in foo/bar.

## git
`pass git push origin master`
Runs an arbitrary git command on the password store.

# The dockerization

## Setup

Run `docker run --interactive --tty --rm --volume gnupg:/root/.gnupg --volume password:/root/.password-store --volume ssh:/root/.ssh emorymerryman/pass:0.0.1`.
This will give you a bash prompt that you can use to do setup.

1. Create an ssh repo where you will have permanent, offline, versioned storage of your passwords.  github.com offers free repos that are suitable for this purpose.

2. Create three named volumes:  `docker volume create gnupg && docker volume create password && docker volume create ssh`

3. Run and setup: `docker run --interactive --tty --rm --volume gnupg:/root/.gnupg --volume password:/root/.password-store --volume ssh:/root/.ssh emorymerryman/pass:0.0.1`
   1. Populate `--volume gnupg:/root/.gnupg` either by
      * Generate a gpg key: `gpg --gen-key`, or
      * use an existing key using `gpg export`, `docker cp`, and `gpg import`.

   2. Populate `--volume ssh:/root/.ssh` either by
      * Generate a new ssh key: `ssh-genkey`, or
      * use an existing key

   3. Populate `--volume password:/root/.password-store` by
      1. `gpg --list-keys`
      2. `pass init ${KEY_ID_FROM_PREVIOUS_STEP}`
      3. `pass git init`
      4. `pass git remote add origin ${SSH_URL_TO_REPO}`

5. add the public key from step 3.2 to the repository in step 1

## Usage

After setup, you can run

`docker run --interactive --tty --rm --volume gnupg:/root/.gnupg --volume password:/root/.password-store --volume ssh:/root/.ssh emorymerryman/pass:0.0.1`

This will give you a bash prompt from which you can issue pass commands.

If you do either `pass generate` or `pass insert`, a password will be created and stored (encrypted) locally.
Executing `pass git push origin master` will store it in the repository.
You can visit the repository and see it there.

## Discussion

This is a preliminary image.
The 4 listed commands are just some of the commands from the pass application.
They have been tested and basically work.
Other commands have not been tested and may or may not work.

### Clipboard
The `pass generate` and `pass show` command have `--clipboard` options which copies the password to the clipboard rather than showing it on the console.
This has not been tested and is believed to not work.

### ENTRYPOINT `pass` versus `bash`
I am undecided about what the entrypoint should be.
In this preliminary version it is `bash` for ease of debugging.

#### `pass`
The most logical entrypoint is `pass`.
Then users could create an alias `pass` for the docker run command and it would be as if they had installed pass on their system.
However, one of the features of pass is that it briefly remembers your GPG passphrase.

```
> pass show foo/bar
[PROMPT FOR PASSPHRASE]
[SHOW foo/bar password]
> pass show other/thing
[SHOW other/thing password]
```

If the entrypoint is `pass` then each invocation of the app will start a fresh container which will not remember the passphrase.

#### `bash`
This solves the remember passphrase problem but it destroys the effect of running an application.
Running the image does not run the application.
Instead it creates a terminal where the user can run the application.
