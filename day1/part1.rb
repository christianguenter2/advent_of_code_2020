input = [1721,
         979,
         366,
         299,
         675,
         1456]

def solve(input)
    return input
        .map(&:to_i)
        .combination(3)
        .to_a
        .filter{ |x,y,z| x + y + z == 2020 }
        .map{ |x,y,z| x*y*z }
end

puts solve(input)
input = File.open("day1/input").readlines()
puts solve(input)
