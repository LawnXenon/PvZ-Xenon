#ifndef XENON_H
#define XENON_H

#include <jni.h>

namespace Xenon {

    // Initializes the Xenon replacement engine
    bool Initialize(JavaVM* vm);

    // Retrieves handles to the dynamically loaded original libraries
    void* GetOriginalLauncherHandle();
    void* GetOriginalMainHandle();
    void* GetOriginalHomuraHandle();

    // Resolves a symbol dynamically from the original GameMain library
    void* ResolveOriginalMainSymbol(const char* symbolName);

    // Resolves a symbol dynamically from the original GameLauncher library
    void* ResolveOriginalLauncherSymbol(const char* symbolName);

} // namespace Xenon

#endif // XENON_H
