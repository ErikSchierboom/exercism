class Clock(hours: Int, minutes: Int) {
  lazy val actualHours = mod((hours * 60 + minutes) / 60.0, 24)
  lazy val actualMinutes = mod(minutes, 60)

  def +(that: Clock) = new Clock(actualHours + that.actualHours, actualMinutes + that.actualMinutes)
  def -(that: Clock) = new Clock(actualHours - that.actualHours, actualMinutes - that.actualMinutes)

  override def toString = f"$actualHours%02d:$actualMinutes%02d"

  override def equals(obj:Any) = obj.isInstanceOf[Clock] && obj.asInstanceOf[Clock].toString == this.toString

  private def mod(x: Double, y: Double) = (((x % y) + y) % y).toInt
}

object Clock {
  def apply(hours: Int, minutes: Int) = new Clock(hours, minutes)
  def apply(minutes: Int) = new Clock(0, minutes)
}