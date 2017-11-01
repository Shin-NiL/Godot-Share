#ifndef GODOT_SHARE_H
#define GODOT_SHARE_H

#include "reference.h"

class GodotShare : public Reference {
    OBJ_TYPE(GodotShare,Reference);
    

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
