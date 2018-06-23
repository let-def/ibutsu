let left_pad str len ch =
  if (String.length str < len) then
    String.make (len - String.length str) ch ^ str
  else
    str
