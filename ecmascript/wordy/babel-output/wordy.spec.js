'use strict';

var _wordy = require('./wordy');

describe('Word Problem', function () {

  it('add 1', function () {
    var question = 'What is 1 plus 1?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(2);
  });

  it('add 2', function () {
    var question = 'What is 53 plus 2?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(55);
  });

  it('add negative numbers', function () {
    var question = 'What is -1 plus -10?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(-11);
  });

  it('add more digits', function () {
    var question = 'What is 123 plus 45678?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(45801);
  });

  it('subtract', function () {
    var question = 'What is 4 minus -12?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(16);
  });

  it('multiply', function () {
    var question = 'What is -3 multiplied by 25?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(-75);
  });

  it('divide', function () {
    var question = 'What is 33 divided by -3?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(-11);
  });

  it('add twice', function () {
    var question = 'What is 1 plus 1 plus 1?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(3);
  });

  it('add then subtract', function () {
    var question = 'What is 1 plus 5 minus -2?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(8);
  });

  it('subtract twice', function () {
    var question = 'What is 20 minus 4 minus 13?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(3);
  });

  it('subtract then add', function () {
    var question = 'What is 17 minus 6 plus 3?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(14);
  });

  it('multiply twice', function () {
    var question = 'What is 2 multiplied by -2 multiplied by 3?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(-12);
  });

  it('add then multiply', function () {
    var question = 'What is -3 plus 7 multiplied by -2?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(-8);
  });

  it('divide twice', function () {
    var question = 'What is -12 divided by 2 divided by -3?';
    expect(new _wordy.WordProblem(question).answer()).toEqual(2);
  });

  it('too advanced', function () {
    var question = 'What is 53 cubed?';
    var problem = new _wordy.WordProblem(question);

    expect(problem.answer.bind(problem)).toThrow(new _wordy.ArgumentError());
  });

  it('irrelevant', function () {
    var question = 'Who is the president of the United States?';
    var problem = new _wordy.WordProblem(question);

    expect(problem.answer.bind(problem)).toThrow(new _wordy.ArgumentError());
  });
});