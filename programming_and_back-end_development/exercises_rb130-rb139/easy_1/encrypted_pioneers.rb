# The following list contains the names of individuals who are pioneers in the field
# of computing or that have had a significant influence on the field. The names are
# in an encrypted form, though, using a simple (and incredibly weak) form of
# encryption called Rot13.

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu

# Write a program that deciphers and prints each of these names.

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

ALPHABET = ('a'..'z').to_a

def decipher(encrypted_char)
  downcased_char = encrypted_char.downcase
  return encrypted_char unless ALPHABET.include?(downcased_char)
  
  current_idx = ALPHABET.index(downcased_char)
  new_idx = (current_idx - 13) % 26 # wrap around

  downcased_char == encrypted_char ? ALPHABET[new_idx] : ALPHABET[new_idx].upcase
end

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher(encrypted_char)
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end
