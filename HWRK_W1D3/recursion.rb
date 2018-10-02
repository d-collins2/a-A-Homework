
def sum_to(n)
  return nil if n <= 0
  return 1 if n == 1
  sum_to(n - 1) + n
end
# # Test Cases
# sum_to(5)  # => returns 15
# sum_to(1)  # => returns 1
# sum_to(9)  # => returns 45
# sum_to(-8)  # => returns nil


def add_numbers(nums_array)
  return nums_array[0] if nums_array.length <= 1
  nums_array.pop + add_numbers(nums_array)
end

# # # Test Cases
#  add_numbers([1,2,3,4]) # => returns 10
#  add_numbers([3]) # => returns 3
#  add_numbers([-80,34,7]) # => returns -39
#  add_numbers([]) # => returns nil


# gamma(n) = (n-1)!
def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1

  gamma_fnc(n-1) * (n - 1)
end

# # Test Cases
# gamma_fnc(0)  # => returns nil
# gamma_fnc(1)  # => returns 1
# gamma_fnc(4)  # => returns 6
# gamma_fnc(8)  # => returns 5040


def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.pop == favorite
  ice_cream_shop(flavors[0...-1],favorite)
end

# # Test Cases
#   ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
#   ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
#   ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
#   ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
#   ice_cream_shop([], 'honey lavender')  # => returns false


def reverse(string)
  return string[0] if string.length <= 1
  reverse(string[1..-1]) + string[0]
end

# # Test Cases
#   reverse("house") # => "esuoh"
#   reverse("dog") # => "god"
#   reverse("atom") # => "mota"
#   reverse("q") # => "q"
#   reverse("id") # => "di"
#   reverse("") # => ""
