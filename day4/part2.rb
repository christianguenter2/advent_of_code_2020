def get_passports(input)

    passport = Struct.new( :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid ) do
        def is_valid
            return self.each_pair do |k,v| 
                return false if !self.send("is_" + k.to_s + "_valid",v)
            end.map{|x| return true}
        end

        def is_byr_valid(byr)
            return byr && (byr.match?(/^\d{4}$/) && byr >= "1920" && byr <= "2002" )
        end

        def is_iyr_valid(iyr)
            return iyr && (iyr.match?(/^\d{4}$/) && iyr >= "2010" && iyr <= "2020" )
        end

        def is_eyr_valid(eyr)
            return eyr && (eyr.match?(/^\d{4}$/) && eyr >= "2020" && eyr <= "2030" )
        end

        def is_hgt_valid(hgt)
            result, height, unit = (hgt || "").match(/^(\d+)(cm|in)$/).to_a
            return result && 
                ( (unit == "cm" && height >= "150" && height <= "193") ||
                  (unit == "in" && height >= "59" && height <= "76") )
        end

        def is_hcl_valid(hcl)
            return hcl && (hcl.match?(/^#[0-9a-f]{6}$/))
        end

        def is_ecl_valid(ecl)
            return ecl && (ecl.match?(/^amb|blu|brn|gry|grn|hzl|oth$/))
        end

        def is_pid_valid(pid)
            return pid && (pid.match?(/^\d{9}$/))
        end

        def is_cid_valid(cid)
            return true
        end

    end

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
    passports.append(p) if p
    return passports
end

def solve(input)
    return get_passports(input).map{|p| p.is_valid}.count(true)
end
