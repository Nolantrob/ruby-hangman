# frozen_string_literal: true

# Define Hangman class
class Hangman
  def initialize
    @guessed_letters = []
    @word = 'SUNDAY'
  end

  def print_intro_text
    puts 'Welcome to Hangman!'
  end

  def print_gamestate
    print_man
    @word.split('').each do |letter|
      if @guessed_letters.include?(letter)
        print "#{letter} "
      else
        print '_ '
      end
    end
    puts ''
  end

  def print_man
    man_body_segments = [" O\n", '/', '|', "\\\n", '/ ', '\\']
    @guessed_letters.each_with_index do |_letter, index|
      if print man_body_segments[index]
    end
    puts ''
  end

  def run_game
    print_intro_text

    while @guessed_letters.size < @word.size
      print_gamestate
      guess_a_letter
    end
    print_gamestate
  end

  def valid_choice?(choice)
    choice =~ /^[a-zA-Z]+$/
  end

  def guess_a_letter # rubocop:disable Metrics/MethodLength
    choice = ''

    until valid_choice?(choice)
      print 'Guess a letter: '
      choice = gets.to_s.chomp
      if valid_choice?(choice)
        @guessed_letters.push(choice.upcase)
      else
        puts 'Invalid choice, try again'
      end
    end

    p @guessed_letters
  end
end
