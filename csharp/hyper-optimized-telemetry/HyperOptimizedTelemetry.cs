using System;

public static class TelemetryBuffer
{
    public static byte[] ToBuffer(long reading)
    {
        var (signed, bytes) = reading switch
        {
            > uint.MaxValue => (true, BitConverter.GetBytes(reading)), 
            > int.MaxValue => (false, BitConverter.GetBytes((uint)reading)),
            > ushort.MaxValue => (true, BitConverter.GetBytes((int)reading)),
            >= ushort.MinValue => (false, BitConverter.GetBytes((ushort)reading)),
            >= short.MinValue => (true, BitConverter.GetBytes((short)reading)),
            >= int.MinValue => (true, BitConverter.GetBytes((int)reading)),
            _ => (true, BitConverter.GetBytes(reading)),
        };

        var buffer = new byte[9];
        buffer[0] = (byte)(signed ? byte.MaxValue + 1 - bytes.Length : bytes.Length);
        Array.Copy(bytes, 0, buffer, 1, bytes.Length);
        
        return buffer;
    }

    public static long FromBuffer(byte[] buffer) =>
        buffer[0] switch
        {
            256 - sizeof(long) => BitConverter.ToInt64(buffer, 1),
            256 - sizeof(int) => BitConverter.ToInt32(buffer, 1),
            256 - sizeof(short) => BitConverter.ToInt16(buffer, 1),
            sizeof(ushort) => BitConverter.ToUInt16(buffer, 1),
            sizeof(uint) => BitConverter.ToUInt32(buffer, 1),
            _ => 0
        };
}
