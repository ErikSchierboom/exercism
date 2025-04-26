using System.Numerics;

public static class IntergalacticTransmission
{
    public static byte[] GetTransmitSequence(byte[] message)
    {
        var bits = message.Length * 8;
        var encodedMessage = new byte[(int)Math.Ceiling(bits / 7.0)];
        
        for (var encodedMessageIdx = 0; encodedMessageIdx < encodedMessage.Length; encodedMessageIdx++)
        {
            var bitIdx = encodedMessageIdx * 7;
            var messageByteShift = bitIdx % 8;
            
            encodedMessage[encodedMessageIdx] = (byte)(message[bitIdx / 8] << messageByteShift);
            
            if (bits - bitIdx >= 7)
                encodedMessage[encodedMessageIdx] |= (byte)(message[Math.Min(message.Length - 1, bitIdx / 8 + 1)] >> 8 - messageByteShift);

            encodedMessage[encodedMessageIdx] &= 0xFE;
            encodedMessage[encodedMessageIdx] |= Parity(encodedMessage[encodedMessageIdx]);
        }

        return encodedMessage;
    }

    public static byte[] DecodeSequence(byte[] encodedMessage)
    {
        var decodedMessage = new byte[encodedMessage.Length * 7 / 8];
        
        for (var receivedMessageIdx = 0; receivedMessageIdx < encodedMessage.Length; receivedMessageIdx++)
        {
            var receivedParity = (byte)(encodedMessage[receivedMessageIdx] & 0x1);
            var receivedByte = (byte)(encodedMessage[receivedMessageIdx] & ~0x1);

            if (Parity(receivedByte) != receivedParity)
                throw new ArgumentException("Invalid parity");

            var decodedMessageIdx = receivedMessageIdx * 7 / 8;
            var receivedByteShift = receivedMessageIdx * 7 % 8;

            decodedMessage[decodedMessageIdx] |= (byte)(receivedByte >> receivedByteShift);
            decodedMessage[Math.Min(decodedMessage.Length - 1, decodedMessageIdx + 1)] |= (byte)(receivedByte << (8 - receivedByteShift));
        }

        return decodedMessage;
    }

    private static byte Parity(byte source) => (byte)(BitOperations.PopCount(source) % 2);
}
