local day_01 = {}

function read_lists_from_file()
  local file = io.open('data.txt', 'rb')

  local first_list = {}
  local second_list = {}

  for line in file:lines() do
    if line ~= '' then
      local line_value_index = 1
      for str in string.gmatch(line, "([^%s]+)") do
        if line_value_index == 1 then
          table.insert(first_list, tonumber(str))
        else
          table.insert(second_list, tonumber(str))
        end
        line_value_index = line_value_index + 1
      end
    end
  end

  file:close()

  table.sort(first_list)
  table.sort(second_list)

  return first_list, second_list
end

function day_01.calculate_distance()
  local first_list, second_list = read_lists_from_file()
  local result = 0
  
  for index = 1, 1000 do
    result = result + math.abs(first_list[index] - second_list[index])
  end

  return result
end

function day_01.calculate_similarity()
  local first_list, second_list = read_lists_from_file()
  local result = 0
  local number_amounts = {}

  for _, v in pairs(second_list) do
    if number_amounts[v] then
      number_amounts[v] = number_amounts[v] + 1
    else
      number_amounts[v] = 1
    end
  end

  for _, v in pairs(first_list) do
    if number_amounts[v] then
      result = result + v * number_amounts[v]
    end
  end

  return result
end

return day_01
