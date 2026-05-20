package com.trans;

/**
 * GameAudio — singleton audio manager stub.
 * Reconstructed from smali.
 */
public class GameAudio {

    private static final GameAudio mInst = new GameAudio();

    public byte[] mAudioData;

    private GameAudio() {}

    public static GameAudio getInstance() {
        return mInst;
    }
}
