package com.drazail.RNBytes.Models.ByteViews;

import com.drazail.RNBytes.Models.ByteBuffer;

public class IntView extends rawView {
    public IntView(String encoding, ByteBuffer buffer) {
        super(encoding, buffer);
    }

    public IntView(String encoding, ByteBuffer buffer, int length) {
        super(encoding, buffer, length);
    }

    public IntView(String encoding, ByteBuffer buffer, int srcOffset, int length) {
        super(encoding, buffer, srcOffset, length);
    }


    /**
     * packing each set of 4 bytes from the view to an int, big endian
     *
     * @return intArray
     */
    public int[] getBufferAsIntArray() {
        if (this.buffer.length % 4 != 0) throw new ArrayIndexOutOfBoundsException("buffer length is not compatible with JAVA int Type");
        int[] intArray = new int[this.buffer.length/4];
        byte[] buffer = this.buffer;
        for (int i = 0; i < buffer.length; i = i + 4) {
            byte[] bytes = new byte[]{buffer[i], buffer[i + 1], buffer[i + 2], buffer[i + 3]};
            intArray[i / 4] = ((bytes[0] & 0x000000ff) << 24) |
                    ((bytes[1] & 0xFF) << 16) |
                    ((bytes[2] & 0xFF) << 8) |
                    ((bytes[3] & 0xFF));
        }
        return intArray;
    }

    /**
     *
     * @param intArray
     */
    public void setBufferFromIntArray(int[] intArray) {
        byte[] bytes = new byte[intArray.length * 4];
        for (int i = 0; i < intArray.length; i++){
            byte[] b = new byte[] {
                    (byte)(intArray[i] >>> 24),
                    (byte)(intArray[i] >>> 16),
                    (byte)(intArray[i] >>> 8),
                    (byte)intArray[i]};
            System.arraycopy(b, 0, bytes, i * 4, 4);
        }

        this.buffer = bytes;
    }
}