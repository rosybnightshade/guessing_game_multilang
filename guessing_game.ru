require 'securerandom'
class Code
  def self.start
    random_number = "#{SecureRandom.random_number(100)}"
    userguess(random_number, 1)
    # puts "#{random_number}"
  end
  def self.userguess(random_number, attempts)
    print "Enter a Number Between 1-100: "
    guess = gets
    guess.strip!
    if guess == random_number
      puts "You guessed the number in #{attempts}"
      return
    elsif guess > random_number
      puts "Too High"
    elsif guess < random_number
      puts "Too Low"
    end # if/eslif
      Code.userguess(random_number, attempts + 1)
  end #self.userguess
end # class Code
Code.start

