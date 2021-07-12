import java.math.BigInteger
import kotlin.random.Random

object DiffieHellman {
    fun privateKey(prime: BigInteger) = Random.nextInt(1, prime.toInt().dec()).toBigInteger()

    fun publicKey(p: BigInteger, g: BigInteger, privKey: BigInteger) = g.modPow(privKey, p)

    fun secret(prime: BigInteger, publicKey: BigInteger, privateKey: BigInteger) = publicKey.modPow(privateKey, prime)
}
