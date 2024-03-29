workspace "Helix"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Helix"
	location "Helix"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" ..outputdir.. "/%{prj.name}")
	objdir ("bin-int/" ..outputdir.. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.17134.0"

		defines
		{
			"HX_PLATFORM_WINDOWS",
			"HX_BUILD_DLL"
		}

	postbuildcommands
	{
		("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
	}
		

	filter "configurations:Debug"
		defines "HX_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "HX_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "HX_DIST"
		optimize "On"


project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}	

	includedirs
	{
		"Helix/vendor/spdlog/include",
		"Helix/src"
	}

	links
	{
		"Helix"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.17134.0"

		defines
		{
			"HX_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "HX_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "HX_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "HX_DIST"
		optimize "On"
	