package com.trans;

import android.media.AudioFormat;
import android.media.AudioTrack;

import java.nio.ByteBuffer;

/**
 * PCM output for the native audio mixer (initAudio/writeData/uninitAudio).
 */
public class GameAudio {

    private static final int SAMPLE_RATE_HZ = 44100;
    private static final int CHANNEL_CONFIG = 2;
    private static final int AUDIO_FORMAT = 0x10;
    private static final GameAudio mInst = new GameAudio();

    public byte[] mAudioData;
    private GameAudioTrack mAudioTrack;

    private GameAudio() {
        mAudioData = new byte[0x2000];
    }

    public static GameAudio getInstance() {
        return mInst;
    }

    /** JNI: (sampleRate, channelConfig, audioFormat) — must match original APK checks. */
    public boolean initAudio(int sampleRate, int channelConfig, int audioFormat) {
        if (mAudioTrack != null) {
            return false;
        }
        if (sampleRate != SAMPLE_RATE_HZ || channelConfig != CHANNEL_CONFIG || audioFormat != AUDIO_FORMAT) {
            return false;
        }
        try {
            int bufferSize = AudioTrack.getMinBufferSize(
                    SAMPLE_RATE_HZ, 3, AudioFormat.ENCODING_PCM_16BIT);
            if (bufferSize <= 0) {
                return false;
            }
            mAudioTrack = new GameAudioTrack(
                    3,
                    SAMPLE_RATE_HZ,
                    3,
                    AudioFormat.ENCODING_PCM_16BIT,
                    bufferSize,
                    AudioTrack.MODE_STREAM,
                    1);
            if (mAudioTrack.getState() != AudioTrack.STATE_INITIALIZED) {
                mAudioTrack.release();
                mAudioTrack = null;
                return false;
            }
            mAudioTrack.play();
            return true;
        } catch (Exception e) {
            mAudioTrack = null;
            return false;
        }
    }

    public void uninitAudio() {
        if (mAudioTrack != null) {
            try {
                mAudioTrack.stop();
                mAudioTrack.release();
            } catch (Exception ignored) {
            }
            mAudioTrack = null;
        }
    }

    public void writeData(ByteBuffer buffer, int position, int size) {
        if (mAudioTrack == null || buffer == null || size <= 0) {
            return;
        }
        buffer.position(position);
        if (mAudioData == null || mAudioData.length < size) {
            mAudioData = new byte[Math.max(size, 0x2000)];
        }
        buffer.get(mAudioData, 0, size);
        mAudioTrack.write(mAudioData, 0, size);
    }

    public void pause() {
        if (mAudioTrack != null && mAudioTrack.getPlayState() == AudioTrack.PLAYSTATE_PLAYING) {
            mAudioTrack.pause();
        }
    }

    public void resume() {
        if (mAudioTrack != null && mAudioTrack.getPlayState() == AudioTrack.PLAYSTATE_PAUSED) {
            mAudioTrack.play();
        }
    }
}
