'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _gradeSchool = require('./grade-school');

var _gradeSchool2 = _interopRequireDefault(_gradeSchool);

describe('School', function () {
  var school = undefined;

  beforeEach(function () {
    school = new _gradeSchool2['default']();
  });

  it('a new school has an empty roster', function () {
    expect(school.roster()).toEqual({});
  });

  it('adding a student adds them to the roster for the given grade', function () {
    school.add('Aimee', 2);

    var expectedDb = { 2: ['Aimee'] };
    expect(school.roster()).toEqual(expectedDb);
  });

  it('adding more students to the same grade adds them to the roster', function () {
    school.add('Blair', 2);
    school.add('James', 2);
    school.add('Paul', 2);

    var expectedDb = { 2: ['Blair', 'James', 'Paul'] };
    expect(school.roster()).toEqual(expectedDb);
  });

  it('adding students to different grades adds them to the roster', function () {
    school.add('Chelsea', 3);
    school.add('Logan', 7);

    var expectedDb = { 3: ['Chelsea'], 7: ['Logan'] };
    expect(school.roster()).toEqual(expectedDb);
  });

  it('grade returns the students in that grade in alphabetical order', function () {
    school.add('Franklin', 5);
    school.add('Bradley', 5);
    school.add('Jeff', 1);

    var expectedStudents = ['Bradley', 'Franklin'];
    expect(school.grade(5)).toEqual(expectedStudents);
  });

  it('grade returns an empty array if there are no students in that grade', function () {
    expect(school.grade(1)).toEqual([]);
  });

  it('the students names in each grade in the roster are sorted', function () {
    school.add('Jennifer', 4);
    school.add('Kareem', 6);
    school.add('Christopher', 4);
    school.add('Kyle', 3);

    var expectedSortedStudents = {
      3: ['Kyle'],
      4: ['Christopher', 'Jennifer'],
      6: ['Kareem']
    };
    expect(school.roster()).toEqual(expectedSortedStudents);
  });

  it('roster cannot be modified outside of module', function () {
    school.add('Aimee', 2);
    var roster = school.roster();
    roster[2].push('Oops.');
    var expectedDb = { 2: ['Aimee'] };
    expect(school.roster()).toEqual(expectedDb);
  });

  it('roster cannot be modified outside of module using grade()', function () {
    school.add('Aimee', 2);
    school.grade(2).push('Oops.');
    var expectedDb = { 2: ['Aimee'] };
    expect(school.roster()).toEqual(expectedDb);
  });
});