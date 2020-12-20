def solve(input)
    return input.map{|line| get_boarding_pass_id(line)}.max
end

def get_boarding_pass_id(line)
    _, row, column = line.match(/^([BF]{7})([RL]{3})$/).to_a
    row = row.gsub("B","1").gsub("F","0").to_i(2)
    column = column.gsub("R","1").gsub("L","0").to_i(2)
    return row * 8 + column
end