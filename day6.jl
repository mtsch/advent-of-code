# extract instructions from a line.
function parseLine(line)
  s = split(line[1:end-1], ' ')

  # turn on/turn off
  if length(s) == 5 
    action = s[2]
    coords = [s[3] s[5]]
  # toggle
  else
    action = s[1]
    coords = [s[2] s[4]]
  end

  # split coords into two vectors of strings
  coords = map(s -> split(s, ','), coords)
  # unpack the vectors of strings
  coords = [ coords[1][1] coords[1][2] coords[2][1] coords[2][2] ]
  # parse numbers in coordiantes. +1 because julia uses 1-based indexing
  coords = map(s -> parse(Int, s) + 1, coords)

  [action coords]
end

# parse the file containing Santa's instructions.
function parseFile(filename)
  f     = open(filename)
  lines = readlines(f)
  close(f)

  map(parseLine, lines)
end

# get the number of lights turned on after following Santa's instructions.
function nLights(filename)
  instrs = parseFile(filename)

  # initial lights
  L = zeros(1000, 1000)

  for i in eachindex(instrs)
    curr = instrs[i]
    if curr[1] == "on"
      L[curr[2]:curr[4], curr[3]:curr[5]] = 1
    elseif curr[1] == "off"
      L[curr[2]:curr[4], curr[3]:curr[5]] = 0
    else
      L[curr[2]:curr[4], curr[3]:curr[5]] += 1
      L[curr[2]:curr[4], curr[3]:curr[5]] %= 2
    end
  end

  sum(L)
end

println(nLights("input6.txt"))
