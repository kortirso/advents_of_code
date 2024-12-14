local day_04 = {}

function day_04.xmas_search()
  local file = io.open('data.txt', 'rb')

  local result = 0
  local lines = {}
  for line in file:lines() do
    if line ~= '' then
      -- horizontal search
      for str in string.gmatch(line, 'XMAS') do
        result = result + 1
      end
      for str in string.gmatch(line, 'SAMX') do
        result = result + 1
      end
      if #lines == 3 then
        -- vertical search
        for char_index = 1, #line do
          if line:sub(char_index, char_index) == 'X' and lines[1]:sub(char_index, char_index) == 'M' and lines[2]:sub(char_index, char_index) == 'A' and lines[3]:sub(char_index, char_index) == 'S' then
            result = result + 1
          elseif line:sub(char_index, char_index) == 'S' and lines[1]:sub(char_index, char_index) == 'A' and lines[2]:sub(char_index, char_index) == 'M' and lines[3]:sub(char_index, char_index) == 'X' then
            result = result + 1
          end
        end

        -- diagonal search \
        for char_index = 4, #line do
          if line:sub(char_index, char_index) == 'X' and lines[1]:sub(char_index - 1, char_index - 1) == 'M' and lines[2]:sub(char_index - 2, char_index - 2) == 'A' and lines[3]:sub(char_index - 3, char_index - 3) == 'S' then
            result = result + 1
          elseif line:sub(char_index, char_index) == 'S' and lines[1]:sub(char_index - 1, char_index - 1) == 'A' and lines[2]:sub(char_index - 2, char_index - 2) == 'M' and lines[3]:sub(char_index - 3, char_index - 3) == 'X' then
            result = result + 1
          end
        end

        -- diagonal search /
        for char_index = 1, #line - 3 do
          if line:sub(char_index, char_index) == 'X' and lines[1]:sub(char_index + 1, char_index + 1) == 'M' and lines[2]:sub(char_index + 2, char_index + 2) == 'A' and lines[3]:sub(char_index + 3, char_index + 3) == 'S' then
            result = result + 1
          elseif line:sub(char_index, char_index) == 'S' and lines[1]:sub(char_index + 1, char_index + 1) == 'A' and lines[2]:sub(char_index + 2, char_index + 2) == 'M' and lines[3]:sub(char_index + 3, char_index + 3) == 'X' then
            result = result + 1
          end
        end
      end

      -- refresh previous lines
      lines[3] = lines[2]
      lines[2] = lines[1]
      lines[1] = line
    end
  end

  file:close()

  return result
end

function day_04.mas_search()
  local file = io.open('data.txt', 'rb')

  local result = 0
  local lines = {}
  for line in file:lines() do
    if line ~= '' then
      if #lines == 2 then
        for char_index = 3, #line do
          local left_match = false
          local right_match = false

          -- diagonal search \
          if line:sub(char_index, char_index) == 'M' and lines[1]:sub(char_index - 1, char_index - 1) == 'A' and lines[2]:sub(char_index - 2, char_index - 2) == 'S' then
            left_match = true
          elseif line:sub(char_index, char_index) == 'S' and lines[1]:sub(char_index - 1, char_index - 1) == 'A' and lines[2]:sub(char_index - 2, char_index - 2) == 'M' then
            left_match = true
          end

          -- diagonal search /
          if line:sub(char_index - 2, char_index - 2) == 'M' and lines[1]:sub(char_index - 1, char_index - 1) == 'A' and lines[2]:sub(char_index, char_index) == 'S' then
            right_match = true
          elseif line:sub(char_index - 2, char_index - 2) == 'S' and lines[1]:sub(char_index - 1, char_index - 1) == 'A' and lines[2]:sub(char_index, char_index) == 'M' then
            right_match = true
          end

          if left_match and right_match then result = result + 1 end
        end
      end

      -- refresh previous lines
      lines[2] = lines[1]
      lines[1] = line
    end
  end

  file:close()

  return result
end

return day_04
