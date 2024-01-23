import { CustomSet } from "./custom-set";

describe("CustomSet", () => {
  describe("empty: returns true if the set contains no elements", () => {
    it("sets with no elements are empty", () => {
      const actual = new CustomSet().empty();
      expect(actual).toBeTruthy();
    });

    it("sets with elements are not empty", () => {
      const actual = new CustomSet([1]).empty();
      expect(actual).toBeFalsy();
    });
  });

  describe("contains: sets can report if they contain an element", () => {
    it("nothing is contained in an empty set", () => {
      const actual = new CustomSet().contains(1);
      expect(actual).toBeFalsy();
    });

    it("when the element is in the set", () => {
      const actual = new CustomSet([1, 2, 3]).contains(1);
      expect(actual).toBeTruthy();
    });

    it("when the element is not in the set", () => {
      const actual = new CustomSet([1, 2, 3]).contains(4);
      expect(actual).toBeFalsy();
    });
  });

  describe("subset: a set is a subset if all of its elements are contained in the other set", () => {
    it("empty set is a subset of another empty set", () => {
      const actual = new CustomSet().subset(new CustomSet());
      expect(actual).toBeTruthy();
    });

    it("empty set is a subset of non-empty set", () => {
      const actual = new CustomSet().subset(new CustomSet([1]));
      expect(actual).toBeTruthy();
    });

    it("non-empty set is not a subset of empty set", () => {
      const actual = new CustomSet([1]).subset(new CustomSet());
      expect(actual).toBeFalsy();
    });

    it("set is a subset of set with exact same elements", () => {
      const actual = new CustomSet([1, 2, 3]).subset(new CustomSet([1, 2, 3]));
      expect(actual).toBeTruthy();
    });

    it("set is a subset of larger set with same elements", () => {
      const actual = new CustomSet([1, 2, 3]).subset(
        new CustomSet([4, 1, 2, 3])
      );
      expect(actual).toBeTruthy();
    });

    it("set is not a subset of set that does not contain its elements", () => {
      const actual = new CustomSet([1, 2, 3]).subset(new CustomSet([4, 1, 3]));
      expect(actual).toBeFalsy();
    });
  });

  describe("disjoint: sets are disjoint if they share no elements", () => {
    it("the empty set is disjoint with itself", () => {
      const actual = new CustomSet().disjoint(new CustomSet([]));
      expect(actual).toBeTruthy();
    });

    it("empty set is disjoint with non-empty set", () => {
      const actual = new CustomSet().disjoint(new CustomSet([1]));
      expect(actual).toBeTruthy();
    });

    it("non-empty set is disjoint with empty set", () => {
      const actual = new CustomSet([1]).disjoint(new CustomSet([]));
      expect(actual).toBeTruthy();
    });

    it("sets are not disjoint if they share an element", () => {
      const actual = new CustomSet([1, 2]).disjoint(new CustomSet([2, 3]));
      expect(actual).toBeFalsy();
    });

    it("sets are disjoint if they share no elements", () => {
      const actual = new CustomSet([1, 2]).disjoint(new CustomSet([3, 4]));
      expect(actual).toBeTruthy();
    });
  });

  describe("eql: sets with the same elements are equal", () => {
    it("empty sets are equal", () => {
      const actual = new CustomSet().eql(new CustomSet());
      expect(actual).toBeTruthy();
    });

    it("empty set is not equal to non-empty set", () => {
      const actual = new CustomSet().eql(new CustomSet([1, 2, 3]));
      expect(actual).toBeFalsy();
    });

    it("non-empty set is not equal to empty set", () => {
      const actual = new CustomSet([1, 2, 3]).eql(new CustomSet());
      expect(actual).toBeFalsy();
    });

    it("sets with the same elements are equal", () => {
      const actual = new CustomSet([1, 2]).eql(new CustomSet([2, 1]));
      expect(actual).toBeTruthy();
    });

    it("sets with different elements are not equal", () => {
      const actual = new CustomSet([1, 2, 3]).eql(new CustomSet([1, 2, 4]));
      expect(actual).toBeFalsy();
    });
  });

  describe("add: unique elements can be added to a set", () => {
    it("add to empty set", () => {
      const actual = new CustomSet().add(3);
      const expected = new CustomSet([3]);
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("add to non-empty set", () => {
      const actual = new CustomSet([1, 2, 4]).add(3);
      const expected = new CustomSet([1, 2, 3, 4]);
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("adding an existing element does not change the set", () => {
      const actual = new CustomSet([1, 2, 3]).add(3);
      const expected = new CustomSet([1, 2, 3]);
      expect(actual.eql(expected)).toBeTruthy();
    });
  });

  describe("intersection: returns a set of all shared elements", () => {
    it("intersection of two empty sets is an empty set", () => {
      const actual = new CustomSet().intersection(new CustomSet());
      const expected = new CustomSet();
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("intersection of an empty set and non-empty set is an empty set", () => {
      const actual = new CustomSet().intersection(new CustomSet([3, 2, 5]));
      const expected = new CustomSet([]);
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("intersection of a non-empty set and an empty set is an empty set", () => {
      const actual = new CustomSet([1, 2, 3, 4]).intersection(
        new CustomSet([])
      );
      const expected = new CustomSet([]);
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("intersection of two sets with no shared elements is an empty set", () => {
      const actual = new CustomSet([1, 2, 3]).intersection(
        new CustomSet([4, 5, 6])
      );
      const expected = new CustomSet([]);
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("intersection of two sets with shared elements is a set of the shared elements", () => {
      const actual = new CustomSet([1, 2, 3, 4]).intersection(
        new CustomSet([3, 2, 5])
      );
      const expected = new CustomSet([2, 3]);
      expect(actual.eql(expected)).toBeTruthy();
    });
  });

  describe("difference of a set is a set of all elements that are only in the first set", () => {
    it("difference of two empty sets is an empty set", () => {
      const actual = new CustomSet().difference(new CustomSet());
      const expected = new CustomSet();
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("difference of empty set and non-empty set is an empty set", () => {
      const actual = new CustomSet().difference(new CustomSet([3, 2, 5]));
      const expected = new CustomSet();
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("difference of a non-empty set and an empty set is the non-empty set", () => {
      const actual = new CustomSet([1, 2, 3, 4]).difference(new CustomSet());
      const expected = new CustomSet([1, 2, 3, 4]);
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("difference of two non-empty sets is a set of elements that are only in the first set", () => {
      const actual = new CustomSet([3, 2, 1]).difference(new CustomSet([2, 4]));
      const expected = new CustomSet([1, 3]);
      expect(actual.eql(expected)).toBeTruthy();
    });
  });

  describe("union: returns a set of all elements in either set", () => {
    it("union of empty sets is an empty set", () => {
      const actual = new CustomSet().union(new CustomSet());
      const expected = new CustomSet();
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("union of an empty set and non-empty set is the non-empty set", () => {
      const actual = new CustomSet().union(new CustomSet([2]));
      const expected = new CustomSet([2]);
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("union of a non-empty set and empty set is the non-empty set", () => {
      const actual = new CustomSet([1, 3]).union(new CustomSet());
      const expected = new CustomSet([1, 3]);
      expect(actual.eql(expected)).toBeTruthy();
    });

    it("union of non-empty sets contains all unique elements", () => {
      const actual = new CustomSet([1, 3]).union(new CustomSet([2, 3]));
      const expected = new CustomSet([1, 2, 3]);
      expect(actual.eql(expected)).toBeTruthy();
    });
  });
});
