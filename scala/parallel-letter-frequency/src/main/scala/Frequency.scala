import scala.concurrent.{Await, Future}
import scala.concurrent.duration._
import scala.concurrent.ExecutionContext.Implicits.global

object Frequency {

  def mergeFrequencies(x: Map[Char, Int], y: Map[Char, Int]) =
    x ++ y.map { case (k,v) => k -> (v + x.getOrElse(k, 0)) }

  def calculateFrequency(text: String) =
    text
      .filter(Character.isLetter)
      .groupBy(Character.toLowerCase)
      .map { case (char, str) => (char, str.length) }

  def calculateFrequencies(texts: Seq[String]) = Future {
    texts.map(calculateFrequency).fold(Map())(mergeFrequencies)
  }

  def createWorkers(parallellism: Int, seq: Seq[String]) = {
    val count = Math.max(seq.length / parallellism, 1)
    seq.grouped(count).map(calculateFrequencies)
  }

  def frequency(parallellism: Int, texts: Seq[String]): Map[Char, Int] = {
    if (parallellism < 1 || texts.isEmpty)
        Map()
    else {
      val workers = createWorkers(parallellism, texts)
      val result = Future.fold[Map[Char, Int], Map[Char, Int]](workers)(Map())(mergeFrequencies)
      Await.result(result, 1 seconds)
    }
  }
}