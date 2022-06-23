require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
         puts "#{@secret_code.num_exact_matches(code)} exact matches."
         puts "#{@secret_code.num_near_matches(code)} near matches."
    end

    def ask_user_for_guess
        print "Enter a code: "
        input_str = gets.chomp
        input = Code.from_string(input_str)
        self.print_matches(input)
        @secret_code == input
    end
end
