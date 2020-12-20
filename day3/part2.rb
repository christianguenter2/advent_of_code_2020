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

    def slope(input,y_axis,xaxis)
        count, x = 0, 0
        input.each_with_index do |line,index|
            if index % y_axis != 0
               next 
            end
            text = (line*input.length())
            count += 1 if (text[x] == "#")
            x += x_axis
        end
        return count
    end

    return slope(input,1,1) * slope(input,1,3) * slope(input,1,5) * slope(input,1,7) * slope(input,2,1)
end

puts solve(input)
input = File.open("day3/input").readlines(&:chomp).map{|l| l.gsub("\n","")}
puts solve(input)