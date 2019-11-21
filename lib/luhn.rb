module Luhn
  
  def self.is_valid?(number)
    doubles = []
    digits = number.to_s.scan(/\d/).reverse.map(&:to_i).map.with_index do |n, index|
      # double every other
      if index.odd?
        double_n = n * 2
        # If doubled value is greater than or equal to 10 take the value and subtract 9
        if double_n >= 10
          double_n - 9
        else
          double_n
        end
      else
        n
      end
    end
    # sum the digits
    # If the sum is divisible by 10 it's a valid number, otherwise it's invalid
    sum = 0
    return false unless (digits.each { |y| sum += y }.reduce(:+) % 10).zero?
    true
  end
end
    
Luhn.is_valid?(419456038500504)
Luhn.is_valid?(4194560385008505)
    

