def can_build(plat):
	return plat=="android" or plat=="iphone"

def configure(env):
	if (env['platform'] == 'android'):
		env.android_add_java_dir("android")
		env.disable_module()

	if env['platform'] == "iphone":
		env.Append(LINKFLAGS=['-ObjC'])
