require "spec"
require "../src/*"

describe "Meetup" do
  it "when teenth Monday is the 13th, the first day of the teenth week" do
    Meetup.meetup(2013, 5, "teenth", "Monday").should eq("2013-05-13")
  end

  it "when teenth Monday is the 19th, the last day of the teenth week" do
    Meetup.meetup(2013, 8, "teenth", "Monday").should eq("2013-08-19")
  end

  it "when teenth Monday is some day in the middle of the teenth week" do
    Meetup.meetup(2013, 9, "teenth", "Monday").should eq("2013-09-16")
  end

  it "when teenth Tuesday is the 19th, the last day of the teenth week" do
    Meetup.meetup(2013, 3, "teenth", "Tuesday").should eq("2013-03-19")
  end

  it "when teenth Tuesday is some day in the middle of the teenth week" do
    Meetup.meetup(2013, 4, "teenth", "Tuesday").should eq("2013-04-16")
  end

  it "when teenth Tuesday is the 13th, the first day of the teenth week" do
    Meetup.meetup(2013, 8, "teenth", "Tuesday").should eq("2013-08-13")
  end

  it "when teenth Wednesday is some day in the middle of the teenth week" do
    Meetup.meetup(2013, 1, "teenth", "Wednesday").should eq("2013-01-16")
  end

  it "when teenth Wednesday is the 13th, the first day of the teenth week" do
    Meetup.meetup(2013, 2, "teenth", "Wednesday").should eq("2013-02-13")
  end

  it "when teenth Wednesday is the 19th, the last day of the teenth week" do
    Meetup.meetup(2013, 6, "teenth", "Wednesday").should eq("2013-06-19")
  end

  it "when teenth Thursday is some day in the middle of the teenth week" do
    Meetup.meetup(2013, 5, "teenth", "Thursday").should eq("2013-05-16")
  end

  it "when teenth Thursday is the 13th, the first day of the teenth week" do
    Meetup.meetup(2013, 6, "teenth", "Thursday").should eq("2013-06-13")
  end

  it "when teenth Thursday is the 19th, the last day of the teenth week" do
    Meetup.meetup(2013, 9, "teenth", "Thursday").should eq("2013-09-19")
  end

  it "when teenth Friday is the 19th, the last day of the teenth week" do
    Meetup.meetup(2013, 4, "teenth", "Friday").should eq("2013-04-19")
  end

  it "when teenth Friday is some day in the middle of the teenth week" do
    Meetup.meetup(2013, 8, "teenth", "Friday").should eq("2013-08-16")
  end

  it "when teenth Friday is the 13th, the first day of the teenth week" do
    Meetup.meetup(2013, 9, "teenth", "Friday").should eq("2013-09-13")
  end

  it "when teenth Saturday is some day in the middle of the teenth week" do
    Meetup.meetup(2013, 2, "teenth", "Saturday").should eq("2013-02-16")
  end

  it "when teenth Saturday is the 13th, the first day of the teenth week" do
    Meetup.meetup(2013, 4, "teenth", "Saturday").should eq("2013-04-13")
  end

  it "when teenth Saturday is the 19th, the last day of the teenth week" do
    Meetup.meetup(2013, 10, "teenth", "Saturday").should eq("2013-10-19")
  end

  it "when teenth Sunday is the 19th, the last day of the teenth week" do
    Meetup.meetup(2013, 5, "teenth", "Sunday").should eq("2013-05-19")
  end

  it "when teenth Sunday is some day in the middle of the teenth week" do
    Meetup.meetup(2013, 6, "teenth", "Sunday").should eq("2013-06-16")
  end

  it "when teenth Sunday is the 13th, the first day of the teenth week" do
    Meetup.meetup(2013, 10, "teenth", "Sunday").should eq("2013-10-13")
  end

  it "when first Monday is some day in the middle of the first week" do
    Meetup.meetup(2013, 3, "first", "Monday").should eq("2013-03-04")
  end

  it "when first Monday is the 1st, the first day of the first week" do
    Meetup.meetup(2013, 4, "first", "Monday").should eq("2013-04-01")
  end

  it "when first Tuesday is the 7th, the last day of the first week" do
    Meetup.meetup(2013, 5, "first", "Tuesday").should eq("2013-05-07")
  end

  it "when first Tuesday is some day in the middle of the first week" do
    Meetup.meetup(2013, 6, "first", "Tuesday").should eq("2013-06-04")
  end

  it "when first Wednesday is some day in the middle of the first week" do
    Meetup.meetup(2013, 7, "first", "Wednesday").should eq("2013-07-03")
  end

  it "when first Wednesday is the 7th, the last day of the first week" do
    Meetup.meetup(2013, 8, "first", "Wednesday").should eq("2013-08-07")
  end

  it "when first Thursday is some day in the middle of the first week" do
    Meetup.meetup(2013, 9, "first", "Thursday").should eq("2013-09-05")
  end

  it "when first Thursday is another day in the middle of the first week" do
    Meetup.meetup(2013, 10, "first", "Thursday").should eq("2013-10-03")
  end

  it "when first Friday is the 1st, the first day of the first week" do
    Meetup.meetup(2013, 11, "first", "Friday").should eq("2013-11-01")
  end

  it "when first Friday is some day in the middle of the first week" do
    Meetup.meetup(2013, 12, "first", "Friday").should eq("2013-12-06")
  end

  it "when first Saturday is some day in the middle of the first week" do
    Meetup.meetup(2013, 1, "first", "Saturday").should eq("2013-01-05")
  end

  it "when first Saturday is another day in the middle of the first week" do
    Meetup.meetup(2013, 2, "first", "Saturday").should eq("2013-02-02")
  end

  it "when first Sunday is some day in the middle of the first week" do
    Meetup.meetup(2013, 3, "first", "Sunday").should eq("2013-03-03")
  end

  it "when first Sunday is the 7th, the last day of the first week" do
    Meetup.meetup(2013, 4, "first", "Sunday").should eq("2013-04-07")
  end

  it "when second Monday is some day in the middle of the second week" do
    Meetup.meetup(2013, 3, "second", "Monday").should eq("2013-03-11")
  end

  it "when second Monday is the 8th, the first day of the second week" do
    Meetup.meetup(2013, 4, "second", "Monday").should eq("2013-04-08")
  end

  it "when second Tuesday is the 14th, the last day of the second week" do
    Meetup.meetup(2013, 5, "second", "Tuesday").should eq("2013-05-14")
  end

  it "when second Tuesday is some day in the middle of the second week" do
    Meetup.meetup(2013, 6, "second", "Tuesday").should eq("2013-06-11")
  end

  it "when second Wednesday is some day in the middle of the second week" do
    Meetup.meetup(2013, 7, "second", "Wednesday").should eq("2013-07-10")
  end

  it "when second Wednesday is the 14th, the last day of the second week" do
    Meetup.meetup(2013, 8, "second", "Wednesday").should eq("2013-08-14")
  end

  it "when second Thursday is some day in the middle of the second week" do
    Meetup.meetup(2013, 9, "second", "Thursday").should eq("2013-09-12")
  end

  it "when second Thursday is another day in the middle of the second week" do
    Meetup.meetup(2013, 10, "second", "Thursday").should eq("2013-10-10")
  end

  it "when second Friday is the 8th, the first day of the second week" do
    Meetup.meetup(2013, 11, "second", "Friday").should eq("2013-11-08")
  end

  it "when second Friday is some day in the middle of the second week" do
    Meetup.meetup(2013, 12, "second", "Friday").should eq("2013-12-13")
  end

  it "when second Saturday is some day in the middle of the second week" do
    Meetup.meetup(2013, 1, "second", "Saturday").should eq("2013-01-12")
  end

  it "when second Saturday is another day in the middle of the second week" do
    Meetup.meetup(2013, 2, "second", "Saturday").should eq("2013-02-09")
  end

  it "when second Sunday is some day in the middle of the second week" do
    Meetup.meetup(2013, 3, "second", "Sunday").should eq("2013-03-10")
  end

  it "when second Sunday is the 14th, the last day of the second week" do
    Meetup.meetup(2013, 4, "second", "Sunday").should eq("2013-04-14")
  end

  it "when third Monday is some day in the middle of the third week" do
    Meetup.meetup(2013, 3, "third", "Monday").should eq("2013-03-18")
  end

  it "when third Monday is the 15th, the first day of the third week" do
    Meetup.meetup(2013, 4, "third", "Monday").should eq("2013-04-15")
  end

  it "when third Tuesday is the 21st, the last day of the third week" do
    Meetup.meetup(2013, 5, "third", "Tuesday").should eq("2013-05-21")
  end

  it "when third Tuesday is some day in the middle of the third week" do
    Meetup.meetup(2013, 6, "third", "Tuesday").should eq("2013-06-18")
  end

  it "when third Wednesday is some day in the middle of the third week" do
    Meetup.meetup(2013, 7, "third", "Wednesday").should eq("2013-07-17")
  end

  it "when third Wednesday is the 21st, the last day of the third week" do
    Meetup.meetup(2013, 8, "third", "Wednesday").should eq("2013-08-21")
  end

  it "when third Thursday is some day in the middle of the third week" do
    Meetup.meetup(2013, 9, "third", "Thursday").should eq("2013-09-19")
  end

  it "when third Thursday is another day in the middle of the third week" do
    Meetup.meetup(2013, 10, "third", "Thursday").should eq("2013-10-17")
  end

  it "when third Friday is the 15th, the first day of the third week" do
    Meetup.meetup(2013, 11, "third", "Friday").should eq("2013-11-15")
  end

  it "when third Friday is some day in the middle of the third week" do
    Meetup.meetup(2013, 12, "third", "Friday").should eq("2013-12-20")
  end

  it "when third Saturday is some day in the middle of the third week" do
    Meetup.meetup(2013, 1, "third", "Saturday").should eq("2013-01-19")
  end

  it "when third Saturday is another day in the middle of the third week" do
    Meetup.meetup(2013, 2, "third", "Saturday").should eq("2013-02-16")
  end

  it "when third Sunday is some day in the middle of the third week" do
    Meetup.meetup(2013, 3, "third", "Sunday").should eq("2013-03-17")
  end

  it "when third Sunday is the 21st, the last day of the third week" do
    Meetup.meetup(2013, 4, "third", "Sunday").should eq("2013-04-21")
  end

  it "when fourth Monday is some day in the middle of the fourth week" do
    Meetup.meetup(2013, 3, "fourth", "Monday").should eq("2013-03-25")
  end

  it "when fourth Monday is the 22nd, the first day of the fourth week" do
    Meetup.meetup(2013, 4, "fourth", "Monday").should eq("2013-04-22")
  end

  it "when fourth Tuesday is the 28th, the last day of the fourth week" do
    Meetup.meetup(2013, 5, "fourth", "Tuesday").should eq("2013-05-28")
  end

  it "when fourth Tuesday is some day in the middle of the fourth week" do
    Meetup.meetup(2013, 6, "fourth", "Tuesday").should eq("2013-06-25")
  end

  it "when fourth Wednesday is some day in the middle of the fourth week" do
    Meetup.meetup(2013, 7, "fourth", "Wednesday").should eq("2013-07-24")
  end

  it "when fourth Wednesday is the 28th, the last day of the fourth week" do
    Meetup.meetup(2013, 8, "fourth", "Wednesday").should eq("2013-08-28")
  end

  it "when fourth Thursday is some day in the middle of the fourth week" do
    Meetup.meetup(2013, 9, "fourth", "Thursday").should eq("2013-09-26")
  end

  it "when fourth Thursday is another day in the middle of the fourth week" do
    Meetup.meetup(2013, 10, "fourth", "Thursday").should eq("2013-10-24")
  end

  it "when fourth Friday is the 22nd, the first day of the fourth week" do
    Meetup.meetup(2013, 11, "fourth", "Friday").should eq("2013-11-22")
  end

  it "when fourth Friday is some day in the middle of the fourth week" do
    Meetup.meetup(2013, 12, "fourth", "Friday").should eq("2013-12-27")
  end

  it "when fourth Saturday is some day in the middle of the fourth week" do
    Meetup.meetup(2013, 1, "fourth", "Saturday").should eq("2013-01-26")
  end

  it "when fourth Saturday is another day in the middle of the fourth week" do
    Meetup.meetup(2013, 2, "fourth", "Saturday").should eq("2013-02-23")
  end

  it "when fourth Sunday is some day in the middle of the fourth week" do
    Meetup.meetup(2013, 3, "fourth", "Sunday").should eq("2013-03-24")
  end

  it "when fourth Sunday is the 28th, the last day of the fourth week" do
    Meetup.meetup(2013, 4, "fourth", "Sunday").should eq("2013-04-28")
  end

  it "last Monday in a month with four Mondays" do
    Meetup.meetup(2013, 3, "last", "Monday").should eq("2013-03-25")
  end

  it "last Monday in a month with five Mondays" do
    Meetup.meetup(2013, 4, "last", "Monday").should eq("2013-04-29")
  end

  it "last Tuesday in a month with four Tuesdays" do
    Meetup.meetup(2013, 5, "last", "Tuesday").should eq("2013-05-28")
  end

  it "last Tuesday in another month with four Tuesdays" do
    Meetup.meetup(2013, 6, "last", "Tuesday").should eq("2013-06-25")
  end

  it "last Wednesday in a month with five Wednesdays" do
    Meetup.meetup(2013, 7, "last", "Wednesday").should eq("2013-07-31")
  end

  it "last Wednesday in a month with four Wednesdays" do
    Meetup.meetup(2013, 8, "last", "Wednesday").should eq("2013-08-28")
  end

  it "last Thursday in a month with four Thursdays" do
    Meetup.meetup(2013, 9, "last", "Thursday").should eq("2013-09-26")
  end

  it "last Thursday in a month with five Thursdays" do
    Meetup.meetup(2013, 10, "last", "Thursday").should eq("2013-10-31")
  end

  it "last Friday in a month with five Fridays" do
    Meetup.meetup(2013, 11, "last", "Friday").should eq("2013-11-29")
  end

  it "last Friday in a month with four Fridays" do
    Meetup.meetup(2013, 12, "last", "Friday").should eq("2013-12-27")
  end

  it "last Saturday in a month with four Saturdays" do
    Meetup.meetup(2013, 1, "last", "Saturday").should eq("2013-01-26")
  end

  it "last Saturday in another month with four Saturdays" do
    Meetup.meetup(2013, 2, "last", "Saturday").should eq("2013-02-23")
  end

  it "last Sunday in a month with five Sundays" do
    Meetup.meetup(2013, 3, "last", "Sunday").should eq("2013-03-31")
  end

  it "last Sunday in a month with four Sundays" do
    Meetup.meetup(2013, 4, "last", "Sunday").should eq("2013-04-28")
  end

  it "when last Wednesday in February in a leap year is the 29th" do
    Meetup.meetup(2012, 2, "last", "Wednesday").should eq("2012-02-29")
  end

  it "last Wednesday in December that is also the last day of the year" do
    Meetup.meetup(2014, 12, "last", "Wednesday").should eq("2014-12-31")
  end

  it "when last Sunday in February in a non-leap year is not the 29th" do
    Meetup.meetup(2015, 2, "last", "Sunday").should eq("2015-02-22")
  end

  it "when first Friday is the 7th, the last day of the first week" do
    Meetup.meetup(2012, 12, "first", "Friday").should eq("2012-12-07")
  end
end
