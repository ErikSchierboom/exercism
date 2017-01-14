import java.util.List;
import java.util.stream.IntStream;

final class RelationshipComputer<T extends Comparable> {

    public Relationship computeRelationship(List<T> list1, List<T> list2) {
        if (list1.size() == list2.size())
            return areEqual(list1, list2) ? Relationship.EQUAL : Relationship.UNEQUAL;

        if (list1.size() < list2.size())
            return isSublist(list1, list2) ? Relationship.SUBLIST : Relationship.UNEQUAL;

        return isSublist(list2, list1) ? Relationship.SUPERLIST : Relationship.UNEQUAL;
    }

    private Boolean areEqual(List<T> list1, List<T> list2) {
        for (int i = 0; i < list1.size(); i++) {
            if (list2.get(i).compareTo(list1.get(i)) != 0)
                return false;
        }

        return true;
    }

    private Boolean isSublist(List<T> list1, List<T> list2) {
        if (list1.size() > list2.size())
            return false;

        if (list1.isEmpty())
            return true;

        return IntStream
            .range(0, list2.size() - list1.size() + 1)
            .anyMatch(i -> areEqual(list1, list2.subList(i, i + list1.size())));
    }
}
