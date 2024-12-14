local day_03 = require('day_03')

describe('corrupted_multi', function()
  it('should returns sum of multiplication', function()
    assert.are.equal(167650499, day_03.corrupted_multi())
  end)
end)

describe('enabled_corrupted_multi', function()
  it('should returns sum of multiplication if do() present', function()
    assert.are.equal(95846796, day_03.enabled_corrupted_multi())
  end)
end)
