# 
#********** Authors: **********
#Pedro Sola Pimentel     9298079
#Lucas Abe Stefan        8531612
#Tec Prog 2 HW1


# Part 1

def sum arr
  a = 0
  arr.each { |b| a += b }
  return a
end

def max_2_sum arr
  if arr.length == 0
    return 0
  elsif arr.length == 1
    return arr[0]
  else
    a1 = arr[0]
    a2 = arr[1]
    arr[2..arr.length].each { |b|
      if b >= a1
        a2 = a1
        a1 = b
          
      end
    }
    return a1 + a2
  end
end

def sum_to_n? arr, n
  arr.each_with_index { |a, i|
    arr[i + 1 .. arr.length].each {|b|
      if a + b == n
        return true
      end
    }
  }
  return false
end

# Part 2

def hello (name)
  return "Hello, " + name
end

def starts_with_consonant? s
  a = (s =~ /^[qwrtypsdfghjklzxcvbnm]/i)

  if (a == nil)
    return false
  else
    return true
  end
end

def binary_multiple_of_4? s
  if (s =~ /[^01]+/) == nil && s != ""
    e = 1
    cont = 0
    arr = s.split("")
    
    arr.reverse.each {|l|
      cont += e * (l.to_i)
      e *= 2
    }
    puts cont
    return cont % 4 == 0
  else
    return false
  end
end

# Part 3

class BookInStock
  def initialize (isbn, price)
    raise ArgumentError unless isbn != "" && price > 0
    @isbn, @price = isbn, price
  end
  attr_accessor :isbn, :price
  def price_as_string
    return "$%.2f" % @price
  end
end
