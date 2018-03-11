#ifndef GODOT_SHARE_H
#define GODOT_SHARE_H

#include <version_generated.gen.h>
#include "reference.h"

class GodotShare : public Reference {
#if VERSION_MAJOR == 3
    GDCLASS(GodotShare, Reference);
#else
    OBJ_TYPE(GodotShare, Reference);
#endif
    

protected:
    static void _bind_methods();
    
    GodotShare* instance;
    
public:

    void shareText(const String &title, const String &subject, const String &text);
    void sharePic(const String &path, const String &title, const String &subject, const String &text);

    GodotShare();
    ~GodotShare();
};

#endif
