import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class Gigasecond {

    private LocalDateTime gigasecondDate;

    public Gigasecond(LocalDate target) {
        this(target.atStartOfDay());
    }

    public Gigasecond(LocalDateTime target) {
        this.gigasecondDate = target.plus(1000000000, ChronoUnit.SECONDS);
    }

    public LocalDateTime getDate() {
        return this.gigasecondDate;
    }
}
