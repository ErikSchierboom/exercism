import Garden from './kindergarten-garden';

describe('Garden', () => {

  it('for Alice', () => {
    expect(new Garden('RC\nGG').alice)
      .toEqual(['radishes', 'clover', 'grass', 'grass']);
  });

  it('another for Alice', () => {
    expect(new Garden('VC\nRC').alice)
      .toEqual(['violets', 'clover', 'radishes', 'clover']);
  });

  it('for Bob', () => {
    expect(new Garden('VVCG\nVVRC').bob)
      .toEqual(['clover', 'grass', 'radishes', 'clover']);
  });

  it('for Bob and Charlie', () => {
    const garden = new Garden('VVCCGG\nVVCCGG');
    expect(garden.bob).toEqual(['clover', 'clover', 'clover', 'clover']);
    expect(garden.charlie).toEqual(['grass', 'grass', 'grass', 'grass']);
  });

});

describe('Full garden', () => {
  const diagram = 'VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV';
  const garden = new Garden(diagram);

  it('for Alice', () => {
    expect(garden.alice)
      .toEqual(['violets', 'radishes', 'violets', 'radishes']);
  });

  it('for Bob', () => {
    expect(garden.bob)
      .toEqual(['clover', 'grass', 'clover', 'clover']);
  });

  it('for Charlie', () => {
    expect(garden.charlie)
      .toEqual(['violets', 'violets', 'clover', 'grass']);
  });

  it('for David', () => {
    expect(garden.david)
      .toEqual(['radishes', 'violets', 'clover', 'radishes']);
  });

  it('for Eve', () => {
    expect(garden.eve)
      .toEqual(['clover', 'grass', 'radishes', 'grass']);
  });

  it('for Fred', () => {
    expect(garden.fred)
      .toEqual(['grass', 'clover', 'violets', 'clover']);
  });

  it('for Ginny', () => {
    expect(garden.ginny)
      .toEqual(['clover', 'grass', 'grass', 'clover']);
  });

  it('for Harriet', () => {
    expect(garden.harriet)
      .toEqual(['violets', 'radishes', 'radishes', 'violets']);
  });

  it('for Ileana', () => {
    expect(garden.ileana)
      .toEqual(['grass', 'clover', 'violets', 'clover']);
  });

  it('for Joseph', () => {
    expect(garden.joseph)
      .toEqual(['violets', 'clover', 'violets', 'grass']);
  });

  it('for Kincaid', () => {
    expect(garden.kincaid)
      .toEqual(['grass', 'clover', 'clover', 'grass']);
  });

  it('for Larry', () => {
    expect(garden.larry)
      .toEqual(['grass', 'violets', 'clover', 'violets']);
  });

});

describe('Disordered class', () => {
  const diagram = 'VCRRGVRG\nRVGCCGCV';
  const students = ['Samantha', 'Patricia', 'Xander', 'Roger'];
  const garden = new Garden(diagram, students);

  it('Patricia', () => {
    expect(garden.patricia)
      .toEqual(['violets', 'clover', 'radishes', 'violets']);
  });

  it('Roger', () => {
    expect(garden.roger)
      .toEqual(['radishes', 'radishes', 'grass', 'clover']);
  });

  it('Samantha', () => {
    expect(garden.samantha)
      .toEqual(['grass', 'violets', 'clover', 'grass']);
  });

  it('Xander', () => {
    expect(garden.xander)
      .toEqual(['radishes', 'grass', 'clover', 'violets']);
  });

});

describe('Two gardens, different students', () => {
  const diagram = 'VCRRGVRG\nRVGCCGCV';
  const garden1 = new Garden(diagram, ['Alice', 'Bob', 'Charlie', 'Dan']);
  const garden2 = new Garden(diagram, ['Bob', 'Charlie', 'Dan', 'Erin']);

  it('Bob and Charlie for each garden', () => {
    expect(garden1.bob)
      .toEqual(['radishes', 'radishes', 'grass', 'clover']);
    expect(garden2.bob)
      .toEqual(['violets', 'clover', 'radishes', 'violets']);
    expect(garden1.charlie)
      .toEqual(['grass', 'violets', 'clover', 'grass']);
    expect(garden2.charlie)
      .toEqual(['radishes', 'radishes', 'grass', 'clover']);
  });

});
