local day_02 = require('day_02')

describe('safe_reports_count', function()
  it('should returns amount of safe reports', function()
    assert.are.equal(549, day_02.safe_reports_count())
  end)
end)

describe('semi_safe_reports_count', function()
  it('should returns amount of safe reports with possible one fault', function()
    assert.are.equal(589, day_02.semi_safe_reports_count())
  end)
end)
