# Password-Generator
This is a Password Generator created in Nim. I made it while experimenting with Nim.

It is always recommended that you enable ***multi-factor authentication*** for whatever service, application, website you are using this program for.

While the password may be unguessable to any human, there's always a chance of **security breaches, and brute-forcing.** Heed this warning.
## Features
It has multiple modes, that can alter the result it creates.
- **digits-only**
    - Only generate a password using digits.
- **lowercase-only**
    - Makes all alphabetic characters lowercase.
- **special-characters**
    - Add more variation into the result, making it even harder to guess.
- **alphabetic-only**
    - Only use A-Z Characters, no digits, or special characters.
## How To Install
Download from Releases. <sub>*Or just download the source, and download the [Nim](https://nim-lang.org) compiler, and compile the program yourself using the `build.sh` file. For example, `./build.sh linux`*</sub>
## How To Use
This program is meant to be used by the terminal.

So, go into the folder where the program is, and open up a terminal there.

Look at the help menu to see how it works via `passwordgen --help` or `passwordgen -h`
## Disclaimer
This password generator unfortunately does not have a feature to copy the result to clipboard, however it gives it to you via stdout(the terminal window)

There is no difference in security, of copying the result to clipboard, or putting the result into stdout.
