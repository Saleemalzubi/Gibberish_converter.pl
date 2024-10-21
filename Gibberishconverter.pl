#!/usr/bin/perl
use strict;
use warnings;

# Subroutine to convert a single word into Gibberish
sub to_gibberish {
    my $word = shift;
    my $gibberish_word = '';

    # Split the word into syllables (vowels and consonants)
    my @syllables = split /([aeiouy])/i, $word;

    for my $syllable (@syllables) {
        if ($syllable =~ /^[aeiou]/i) {
            # If syllable starts with a vowel, prepend 'idig'
            $gibberish_word .= 'idig' . $syllable;
        } else {
            # If syllable starts with a consonant, append 'idig'
            $gibberish_word .= $syllable . 'idig';
        }
    }

    return $gibberish_word;
}

# Subroutine to convert a full sentence into Gibberish
sub sentence_to_gibberish {
    my $sentence = shift;
    my @words = split /\s+/, $sentence; # Split the sentence into words
    my @gibberish_sentence;

    # Convert each word to Gibberish
    foreach my $word (@words) {
        push @gibberish_sentence, to_gibberish($word);
    }

    # Join the Gibberish words back into a sentence
    return join(' ', @gibberish_sentence);
}

# Main program
print "Enter a sentence to convert to Gibberish: ";
my $input = <STDIN>;
chomp($input);

# Convert the sentence to Gibberish and print it
my $gibberish_output = sentence_to_gibberish($input);
print "Gibberish: $gibberish_output\n";


