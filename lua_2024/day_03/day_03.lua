local day_03 = {}

-- mul(1,2)
function multiplicate(str)
  local result = 0
  -- extract numbers with comma
  for str2 in string.gmatch(str, "%d+[,]%d+") do
    local comma_index = string.find(str2, ",")
    result = tonumber(string.sub(str2, 1, comma_index - 1)) * tonumber(string.sub(str2, comma_index + 1))
  end

  return result
end

function day_03.corrupted_multi()
  local file = io.open('data.txt', 'rb')

  local result = 0
  for line in file:lines() do
    if line ~= '' then
      -- extract everything matches mul(1,2)
      for str in string.gmatch(line, "mul[(]%d+[,]%d+[)]") do
        result = result + multiplicate(str)
      end
    end
  end

  file:close()

  return result
end

function day_03.enabled_corrupted_multi()
  local file = io.open('data.txt', 'rb')
  local data = file:read("*all")

  local result = 0
  local disable_indices = {}
  local last_index = 1
  repeat
    local index = string.find(data, "don[']t[(][)]", last_index)

    if index ~= nil then
      table.insert(disable_indices, index)
      last_index = index + 7
    end
  until index == nil

  local enable_indices = {}
  last_index = 1
  repeat
    local index = string.find(data, "do[(][)]", last_index)

    if index ~= nil then
      table.insert(enable_indices, index)
      last_index = index + 7
    end
  until index == nil

  last_index = 1
  repeat
    local start_index, end_index = string.find(data, "mul[(]%d+[,]%d+[)]", last_index)

    if start_index ~= nil then
      -- find closest disable index
      local closest_disable_index = nil

      for _, disable_index in pairs(disable_indices) do
        if start_index > disable_index then
          closest_disable_index = disable_index
        end
      end

      -- find closest enable index
      local closest_enable_index = nil

      for _, enable_index in pairs(enable_indices) do
        if start_index > enable_index then
          closest_enable_index = enable_index
        end
      end
      
      -- if enable and disable present and enable > disable - calculate multi
      if closest_disable_index == nil then
        result = result + multiplicate(string.sub(data, start_index, end_index))
      elseif closest_enable_index ~= nil and closest_enable_index > closest_disable_index then
        result = result + multiplicate(string.sub(data, start_index, end_index))
      end

      last_index = end_index
    end
  until start_index == nil

  file:close()

  return result
end

return day_03
