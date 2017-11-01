#include "register_types.h"
#include "object_type_db.h"
#include "core/globals.h"
#include "ios/src/godotShare.h"

void register_share_types() {
    Globals::get_singleton()->add_singleton(Globals::Singleton("GodotShare", memnew(GodotShare)));
}

void unregister_share_types() {
}
