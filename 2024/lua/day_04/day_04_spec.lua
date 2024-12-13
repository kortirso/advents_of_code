local day_04 = require('day_04')

describe('xmas_search', function()
  it('should returns amount of xmas words', function()
    assert.are.equal(2578, day_04.xmas_search())
  end)
end)

describe('mas_search', function()
  it('should returns amount of mas words', function()
    assert.are.equal(1972, day_04.mas_search())
  end)
end)
