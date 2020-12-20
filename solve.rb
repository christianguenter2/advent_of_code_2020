day = "day" + ARGV[0]
part = ARGV[1] || 1
file = ARGV[2] || "input"

input = File.open(day + "/" + file).readlines(&:chomp).map{|l| l.gsub("\n","")}

require_relative(day + "/part" + part + ".rb")
puts solve(input)