input = 
    ["1-3 a: abcde",
     "1-3 b: cdefg",
     "2-9 c: ccccccccc"]

def parse_line(line) 
    return line.split(" ")
end

def evaluate(obj)
    min, max = obj[0].split("-")
    letter = obj[1].split(//)[0]
    letters = obj[2].split(//)
    if (letters[min.to_i - 1] == letter) ^ (letters[max.to_i - 1] == letter)
        return 1
    else
        return 0
    end
end

def solve(input) 
    return input.map{ |x| evaluate(parse_line(x))}.inject(0,:+)
end

puts solve(input)
input = File.open("day2/input").readlines()
puts solve(input)