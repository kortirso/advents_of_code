local day_02 = {}

function is_number_valid(values)
  local positive_changes = 0
  local negative_changes = 0
  local invalid_changes = 0
  for index = 2, #values do
    local changing = values[index] - values[index - 1]
    if changing > 0 then
      positive_changes = positive_changes + 1
    elseif changing < 0 then
      negative_changes = negative_changes + 1
    end

    if changing == 0 or changing > 3 or changing < -3 then
      invalid_changes = invalid_changes + 1
    end
  end

  if invalid_changes > 0 then
    return false
  elseif positive_changes > 0 and negative_changes == 0 then
    return true
  elseif positive_changes == 0 and negative_changes > 0 then
    return true
  else
    return false
  end
end

function generate_new_numbers(values, index_for_remove)
  local result = {}

  for index = 1, #values do
    if index ~= index_for_remove then table.insert(result, values[index]) end
  end

  return result
end

function day_02.safe_reports_count()
  local file = io.open('data.txt', 'rb')

  local result = 0

  for line in file:lines() do
    if line ~= '' then
      local numbers = {}
      for str in string.gmatch(line, "([^%s]+)") do
        table.insert(numbers, tonumber(str))
      end

      if is_number_valid(numbers) then
        result = result + 1
      end
    end
  end

  file:close()

  return result
end

function day_02.semi_safe_reports_count()
  local file = io.open('data.txt', 'rb')

  local result = 0

  for line in file:lines() do
    if line ~= '' then
      local numbers = {}
      for str in string.gmatch(line, "([^%s]+)") do
        table.insert(numbers, tonumber(str))
      end

      if is_number_valid(numbers) then
        result = result + 1
      else
        local valid_additional_numbers = 0

        -- check is any of shorted numbers is valid
        for index = 1, #numbers do
          if is_number_valid(generate_new_numbers(numbers, index)) then
            valid_additional_numbers = valid_additional_numbers + 1
          end
        end

        if valid_additional_numbers > 0 then
          result = result + 1
        end
      end
    end
  end

  file:close()

  return result
end

return day_02
