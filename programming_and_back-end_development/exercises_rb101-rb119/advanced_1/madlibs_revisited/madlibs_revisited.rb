=begin
Let's build another program using madlibs. We made a program like this in the
easy exercises. This time, the requirements are a bit different.

Make a madlibs program that reads in some text from a text file that you have
created, and then plugs in a selection of randomized nouns, verbs, adjectives,
and adverbs into that text and prints it. You can build your lists of nouns,
verbs, adjectives, and adverbs directly into your program, but the text data
should come from a file or other external source. Your program should read this
text, and for each line, it should place random words of the appropriate types
into the text, and print the result.

The challenge of this program isn't about writing your program; it's about
choosing how to represent your data. Choose the right way to structure your
data, and this problem becomes a whole lot easier. This is why we don't show
you what the input data looks like; the input representation is your
responsibility.

Example output:

The sleepy brown cat noisily
licks the sleepy yellow
dog, who lazily licks his
tail and looks around.

Example text data

The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around.

Example replacement words

adjectives: quick lazy sleepy ugly
nouns: fox dog head leg
verbs: jumps lifts bites licks
adverb: easily lazily noisily excitedly
=end

adjectives = %w[quick lazy sleepy ugly]
nouns = %w[fox dog head leg]
verbs = %w[jumps lifts bites licks]
adverb = %w[easily lazily noisily excitedly]

File.foreach("sample_text.txt") do |line|
  puts line % {
                adjective: adjectives.sample,
                noun: nouns.sample,
                verb: verbs.sample,
                adverb: adverb.sample
              }
end
