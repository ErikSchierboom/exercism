public final class QueenAttackCalculator {

    private final BoardCoordinate queen1;
    private final BoardCoordinate queen2;

    QueenAttackCalculator(BoardCoordinate queen1, BoardCoordinate queen2) {
        if (queen1 == null || queen2 == null) {
            throw new IllegalArgumentException("You must supply valid board coordinates for both Queens.");
        }
        if (queen1.getRank() == queen2.getRank() && queen1.getFile() == queen2.getFile()) {
            throw new IllegalArgumentException("Queens may not occupy the same board coordinate.");
        }

        this.queen1 = queen1;
        this.queen2 = queen2;
    }

    public boolean canQueensAttackOneAnother() {
        return this.queen1.getRank() == this.queen2.getRank() ||
               this.queen1.getFile() == this.queen2.getFile() ||
               Math.abs(this.queen1.getRank() - this.queen2.getRank()) == Math.abs(this.queen1.getFile() - this.queen2.getFile());
    }
}
