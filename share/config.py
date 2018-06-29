def can_build(plat):
	return plat=="android" or plat=="iphone"

def configure(env):
	if (env['platform'] == 'android'):
		env.android_add_java_dir("android")
		env.android_add_to_manifest("android/AndroidManifestChunk.xml")
		env.android_add_dependency("compile 'com.android.support:support-v4:27.+'")
		env.android_add_res_dir("android/res")
		env.disable_module()

	if env['platform'] == "iphone":
		env.Append(LINKFLAGS=['-ObjC'])
