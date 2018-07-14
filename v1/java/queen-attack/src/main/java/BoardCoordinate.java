public final class BoardCoordinate {
    private final int rank;
    private final int file;

    BoardCoordinate(int rank, int file) {
        if (rank < 0 ) {
            throw new IllegalArgumentException("Coordinate must have positive rank.");
        }
        if (rank > 7) {
            throw new IllegalArgumentException("Coordinate must have rank <= 7.");
        }
        if (file < 0) {
            throw new IllegalArgumentException("Coordinate must have positive file.");
        }
        if (file > 7) {
            throw new IllegalArgumentException("Coordinate must have file <= 7.");
        }

        this.rank = rank;
        this.file = file;
    }

    public int getRank() {
        return rank;
    }

    public int getFile() {
        return file;
    }
}
