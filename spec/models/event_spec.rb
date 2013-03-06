require 'spec_helper'

describe Event do
  describe '::format_date' do
    it 'formats dates for database' do
      date_time = Time.utc("2013","1","1")

      Event.format_date(date_time).should eq("2013-01-01 00:00:00")
    end
  end

  describe '::param_to_date' do
    it 'converts date as hash into utc time obect' do
      params = {year: "2013", month: "1", day: "1"}
      utc = Time.utc("2013","1","1")

      Event.param_to_date(params).should eq(utc)
    end
  end
end
