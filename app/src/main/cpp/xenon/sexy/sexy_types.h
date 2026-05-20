#ifndef XENON_SEXY_TYPES_H
#define XENON_SEXY_TYPES_H

namespace Sexy {

    // PopCap's standard 32-bit RGBA color representation
    struct Color {
        int mRed;
        int mGreen;
        int mBlue;
        int mAlpha;

        Color() : mRed(255), mGreen(255), mBlue(255), mAlpha(255) {}
        Color(int r, int g, int b, int a = 255) : mRed(r), mGreen(g), mBlue(b), mAlpha(a) {}
    };

    // PopCap's standard template rectangle
    template<typename T>
    struct TRect {
        T mX;
        T mY;
        T mWidth;
        T mHeight;

        TRect() : mX(0), mY(0), mWidth(0), mHeight(0) {}
        TRect(T x, T y, T w, T h) : mX(x), mY(y), mWidth(w), mHeight(h) {}
    };

    // Stubs for base framework classes
    class Graphics {
        // Placeholder for drawing context
    };

    class Image {
    public:
        virtual ~Image() = default;
    };

    class MemoryImage : public Image {
    public:
        // Placeholder for pixel image buffer
    };

    class SexyAppBase {
    public:
        virtual ~SexyAppBase() = default;
    };

} // namespace Sexy

#endif // XENON_SEXY_TYPES_H
