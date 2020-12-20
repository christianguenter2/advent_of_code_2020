input = [
    "..##.......",
    "#...#...#..",
    ".#....#..#.",
    "..#.#...#.#",
    ".#...##..#.",
    "..#.##.....",
    ".#.#.#....#",
    ".#........#",
    "#.##...#...",
    "#...##....#",
    ".#..#...#.#" ]

def solve(input)
    count = 0
    x = 0
    input.each_with_index do |line,index|
        text = (line*(index/3+1))
        if (text.split(//)[x] == "#")
            count += 1
        end
        x += 3
    end
    return count
end

puts solve(input)
input = File.open("day3/input").readlines(&:chomp).map{|l| l.gsub("\n","")}
puts solve(input)