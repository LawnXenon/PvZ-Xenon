#ifndef XENON_ARM32_HOOK_H
#define XENON_ARM32_HOOK_H

#include <cstddef>
#include <cstdint>

namespace Xenon {
namespace Arm32Hook {

// Installs an inline hook on an ARMv7 target (ARM or Thumb, per LSB of target).
// On success, *out_trampoline points to executable stub that runs the stolen
// prologue then jumps back into the original function.
// out_backup must hold at least 12 bytes; out_patch_size receives 8 (ARM) or 12 (Thumb).
bool Install(void* target, void* detour, void** out_trampoline,
             uint8_t* out_backup, size_t* out_patch_size, bool* out_is_thumb);

// Restores original bytes and frees the trampoline allocation.
bool Remove(void* target, void* trampoline, const uint8_t* backup, size_t patchSize, bool isThumb);

} // namespace Arm32Hook
} // namespace Xenon

#endif
