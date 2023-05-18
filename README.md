# Password-Generator
This is a Password Generator created in Nim. I made it while experimenting with Nim.

It is always recommended that you enable ***multi-factor authentication*** for whatever service, application, website you are using this program for.

While the password may be unguessable to any human, there's always a chance of **security breaches, and brute-forcing by AI.**  Heed this warning, and enable **multi-factor authentication**.

But it can be more than a Password Generator, also being a Username Generator (gibberish), and a PIN generator.
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
Download from Releases. <sub>*Or just download the source, and download the [Nim](https://nim-lang.org) compiler, and compile the program yourself via `nimble install`.*</sub>
## How To Use
This program is meant to be used **in** the terminal.

So, go into the folder where the program is, and open up a terminal there.

Look at the help menu to see the flags via `passwordgen --help` or `passwordgen -h`. The documentation is here, but I made sure the flag names indicate what they do, so you don't need to look here.

For generating secure passwords, I suggest the flag `--special-characters` and when specifying the length, have it above 50 if possible.

If you want a random username, then I suggest the `--alphabetic-only` flag.

Or, if you need a randomly generated PIN, I suggest the `--digits-only` flag.
## Disclaimer
This password generator unfortunately does not have a feature to copy the result to clipboard, however it gives it to you via stdout(the terminal window)

There is no difference in security, of copying the result to clipboard, or putting the result into stdout.

<sub>*(Copying to Clipboard is unsafe, as other applications can get whatever was copied to clipboard at any time.)*</sub>
# LICENSE
This application uses the MIT License.
