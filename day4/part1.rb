def get_passports(input)

    passport = Struct.new( :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid )
    passports = []
    p = passport.new()

    input.each do |line|
        if line == ""
            passports.append(p)
            p = passport.new()
        else
            line.split(" ").each do |item|
                id, value = item.split(":")
                p[id] = value
            end
        end
    end
    return passports
end

def is_valid(passport)
    valid = true
    passport.each_pair { |k,v| valid = false if (v == nil && k != :cid) }
    return valid
end

def solve(input)
    return get_passports(input).map{|p| is_valid(p)}.count(true)
end
