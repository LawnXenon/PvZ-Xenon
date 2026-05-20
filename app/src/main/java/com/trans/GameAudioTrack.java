package com.trans;

import android.media.AudioTrack;

/**
 * GameAudioTrack — custom AudioTrack wrapper stub.
 * Reconstructed from smali (package-private class extending AudioTrack).
 */
class GameAudioTrack extends AudioTrack {

    private final int mFrameSize;

    public GameAudioTrack(int streamType, int sampleRateInHz, int channelConfig,
                          int audioFormat, int bufferSizeInBytes, int mode, int frameSize) {
        super(streamType, sampleRateInHz, channelConfig, audioFormat, bufferSizeInBytes, mode);
        this.mFrameSize = frameSize;
    }
}
