#!/usr/bin/env ruby
# coding: utf-8
# Name Generator
# Written in Ruby by Alexis « Sam » « Siphoné » Viguié on the 12-02-2016 and finished on the 31-05-2016
# No license applied.

# Exit in case there is no argument or it is invalid
abort "Please specify a number between 3 and 12." unless ARGV[0] && ARGV[0].to_i.between?(3, 12)

# Defining letters frequency
wov = ['e'] * 5 +
      ['a', 'i', 'o'] * 3 +
      ['u'] * 2 +
      ['y']
con = ['b', 'c', 'd', 'l', 'r', 's', 't'] * 3 +
      ['f', 'g', 'h', 'j', 'm', 'n', 'p', 'v'] * 2 +
      ['k', 'q', 'w', 'x', 'z']

# Declaring the name string
name = String.new

# The following method is called to avoid repetition of more of two of the same group of letters in order to produce a pronouncable name
def check_twolast_include name_array, letters
  if name_array.length < 2                                              # If the name lenght is inferior to two,
    return false                                                        # return a negative answer,
  else                                                                  # or else,
    return name_array.last(2).all? { |char| letters.include? char }     # return if the two last characters of the name are from the same group or not.
  end
end

# Looping to add a letter the number of times specified in the argument
ARGV[0].to_i.times do
  rannum = rand 0..1
  name += if ((rannum == 0) &&                                                  # If the random number calls for a consonant, and
              !(check_twolast_include name.split(''), con)) ||                  # the last two letters are not consonants, or
             ((rannum == 1) &&                                                  # if the random number calls for a wovel, but
              (check_twolast_include name.split(''), wov))                      # the last two letters are wovels :
            con.sample                                                          # add a consonant to the name,
          else                                                                  # or else,
            wov.sample                                                          # add a wovel to the name.
          end
end

# Display the name with a capital letter
puts name.capitalize

# Exit with the zero code as everything went fine
exit 0
