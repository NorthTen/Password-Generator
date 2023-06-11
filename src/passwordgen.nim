import std/[sysrand,strutils];
import cligen;
import checksums/sha3;
proc sample(strin:string):char = # Gets a random byte from system's entropy pool and tries to get an integer.
  var ch=' ';
  #while ((ints<0) or (ints>strin.len())):
  while true:
    var rb = urandom(1)
    var first_btye = rb[0]
    var bytechar = first_btye.chr()
    #echo "Char: "&bytechar
    #if bytechar.isDigit():
      #ints=int(bytechar)
    if strin.find(bytechar) != -1:
      ch=bytechar;
      break

  #echo "Int: "&ints.intToStr()

  #return strin[ints]
  return ch

# Sample has 2 options.
# The option we're using has it so we get a random character from the system's entropy pool, and if it's in the alphabet the code provided, we return it.
# The second option is that we only retrieve integers from the entropy pool, and get whatever the character from the alphabet the integer gives us.


proc passwordgen(
  length:int,
  digits_only:bool=false,
  lowercase_only:bool=false,
  special_characters:bool=false,
  alphabetic_only:bool=false,
  hash_res:bool=false
  ) =
  ##A Password Generator, Username Generator, and PIN Generator. You make it how you want to. It is always recommended that you enable multi-factor authentication for whatever service, application, website you are using this program for.
  ##
  ##For generating secure passwords, I suggest the flag --special-characters and when specifying the length, have it above 50 if possible.
  ##
  ##If you want a random username, then I suggest the --alphabetic-only flag.
  ##Or, if you need a randomly generated PIN, I suggest the --digits-only flag.
  ##
  ##Here are the flags below:
  var length=length-1 #Makes the result's length correct.
  var result="";
  const regalpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
  const alphabet = regalpha&"0123456789-+=."; # Concatenated with regalpha.
  const sc_alphabet = alphabet&"*&^%$#@[]{}'\";?,></\\"; # Concatenated with alphabet.
  const digit_alph = "0123456789";

  if (not digits_only):
    while result.len()<=length: # not lowercase only
        if alphabetic_only:
          result.add(sample(regalpha));continue;
        if special_characters:
          result.add(sample(sc_alphabet));
        else:
          result.add(sample(alphabet));
  else:
    while result.len()<=length:
      result.add(sample(digit_alph))
  # handle the result.
  if lowercase_only:
    result=result.toLowerAscii() # convert to lowercase
  
  if hash_res:
    result = $Sha3_256.secureHash(result) # char '$' returns the string representation of the Sha3Digest returned from secureHash.

  echo result; # print to stdout(terminal/console).
  return;

dispatch passwordgen,help={
  "length":"Set how many characters to generate.",
  "digits_only":"Makes the output only numbers 0-9. No alphabetical characters will be in the output.",
  "lowercase_only":"Makes the output all lowercase, if possible.",
  "special_characters":"Add special characters into the output. This is a flag and not set by default because some services may not allow specific special characters.",
  "alphabetic_only":"Makes the output only alphabetic, no special characters.",
  "hash_res":"Algorithm: Sha3_256. Hashes the result, resulting in a more complicated, un-guessable output. Could be used for something else."
  }
