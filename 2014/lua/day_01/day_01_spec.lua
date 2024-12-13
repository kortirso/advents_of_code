local day_01 = require('day_01')

describe('calculate_distance', function()
  it('should returns total distance', function()
    assert.are.equal(2066446, day_01.calculate_distance())
  end)
end)

describe('calculate_similarity', function()
  it('should returns calculate_similarity', function()
    assert.are.equal(24931009, day_01.calculate_similarity())
  end)
end)
