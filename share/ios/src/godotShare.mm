#include "godotShare.h"


#import "app_delegate.h"


GodotShare::GodotShare() {
    ERR_FAIL_COND(instance != NULL);
    instance = this;
}

GodotShare::~GodotShare() {
    instance = NULL;
}



void GodotShare::shareText(const String &title, const String &subject, const String &text) {
    
    UIViewController *root_controller = [[UIApplication sharedApplication] delegate].window.rootViewController;
    
    NSString * message = [NSString stringWithCString:text.utf8().get_data() encoding:NSUTF8StringEncoding];
    
    NSArray * shareItems = @[message];
    
    UIActivityViewController * avc = [[UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];
    //if iPhone
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [root_controller presentViewController:avc animated:YES completion:nil];
    }
    //if iPad
    else {
        // Change Rect to position Popover
        avc.modalPresentationStyle = UIModalPresentationPopover;
        avc.popoverPresentationController.sourceView = root_controller.view;
        avc.popoverPresentationController.sourceRect = CGRectMake(CGRectGetMidX(root_controller.view.bounds), CGRectGetMidY(root_controller.view.bounds),0,0);
        avc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection(0);
        [root_controller presentViewController:avc animated:YES completion:nil];
    }
}

void GodotShare::sharePic(const String &path, const String &title, const String &subject, const String &text) {
    UIViewController *root_controller = [[UIApplication sharedApplication] delegate].window.rootViewController;
    
    NSString * message = [NSString stringWithCString:text.utf8().get_data() encoding:NSUTF8StringEncoding];
    NSString * imagePath = [NSString stringWithCString:path.utf8().get_data() encoding:NSUTF8StringEncoding];
    
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
    NSArray * shareItems = @[message, image];
    
    UIActivityViewController * avc = [[UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];
     //if iPhone
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [root_controller presentViewController:avc animated:YES completion:nil];
    }
    //if iPad
    else {
        // Change Rect to position Popover
        avc.modalPresentationStyle = UIModalPresentationPopover;
        avc.popoverPresentationController.sourceView = root_controller.view;
        avc.popoverPresentationController.sourceRect = CGRectMake(CGRectGetMidX(root_controller.view.bounds), CGRectGetMidY(root_controller.view.bounds),0,0);
        avc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection(0);
        [root_controller presentViewController:avc animated:YES completion:nil];
    }
}



void GodotShare::_bind_methods() {
#if VERSION_MAJOR == 3
    ClassDB::bind_method(D_METHOD("shareText"), &GodotShare::shareText);
    ClassDB::bind_method(D_METHOD("sharePic"), &GodotShare::sharePic);
#else
    ObjectTypeDB::bind_method("shareText", &GodotShare::shareText);
    ObjectTypeDB::bind_method("sharePic", &GodotShare::sharePic);
#endif
    
}
