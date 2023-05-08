import std/[random,strutils];
import cligen


proc passwordgen(length:int,digits_only:bool=false,lowercase_only:bool=false,special_characters:bool=false,alphabetic_only:bool=false) =
  randomize(); # Initializes a random seed for 'random'.
  var result="";
  const regalpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
  const alphabet = regalpha&"0123456789-+=."; # Concatenated with regalpha.
  const sc_alphabet = alphabet&"*&^%$#@[]{}'\";?,></\\"; # Concatenated with alphabet.
  if (not digits_only):
    while result.len()<=length:
        if not lowercase_only: # not lowercase only
          if alphabetic_only:
            result.add(sample(regalpha));continue;
          if special_characters:
            result.add(sample(sc_alphabet));
          else:
            result.add(sample(alphabet));
        else: #lowercase only
          var alph=""; # temporary variable to utilize an alphabet variable
          if special_characters:
            alph=sc_alphabet;
          else:
            alph=alphabet;
          if alphabetic_only:
            alph=regalpha;
          var ch = sample(alph);
          ch = toLowerAscii(ch); # turn it lowercase using strutils.
          result.add(ch);
  elif digits_only:
    while result.len()<=length:
      result.add(sample("1234567890"))
  # handle the result.
  echo result; # print to stdout(terminal/console).
  return;
dispatch passwordgen
