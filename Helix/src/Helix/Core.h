#pragma once

#ifdef HX_PLATFORM_WINDOWS
	#ifdef HX_BUILD_DLL
		#define HELIX_API __declspec(dllexport)
	#else
		#define HELIX_API __declspec(dllimport)
#endif
#endif