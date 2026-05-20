package com.trans;

import android.media.AudioFormat;
import android.media.AudioTrack;

/**
 * Custom AudioTrack used by GameAudio (public — matches original APK).
 */
public class GameAudioTrack extends AudioTrack {

    private final int mFrameSize;

    public GameAudioTrack(int streamType, int sampleRateInHz, int channelConfig,
                          int audioFormat, int bufferSizeInBytes, int mode, int frameSize) {
        super(streamType, sampleRateInHz, channelConfig, audioFormat, bufferSizeInBytes, mode);
        if (audioFormat == AudioFormat.ENCODING_PCM_16BIT) {
            mFrameSize = getChannelCount() * 2;
        } else {
            mFrameSize = getChannelCount();
        }
        if (frameSize > 0) {
            // frameSize param from original game init path
        }
    }

    public void initBuffer() {
        int frameCount = getNativeFrameCount();
        int size = frameCount * mFrameSize;
        if (size > 0) {
            write(new byte[size], 0, size);
        }
    }

    @Override
    public void play() {
        super.play();
        initBuffer();
    }
}
