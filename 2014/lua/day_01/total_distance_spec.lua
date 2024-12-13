local total_distance = require('total_distance')

describe('total_distance', function()
  it('should returns total distance', function()
    assert.are.equal(2066446, total_distance.calculate_distance())
  end)
end)
