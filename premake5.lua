project "spdlog"
	kind "StaticLib"
	language "C++"

	targetdir("%{wks.location}/Build/Binary/"..output_dir.."/%{prj.name}");
	objdir("%{wks.location}/Build/Intermediate/"..output_dir.."/%{prj.name}");

	characterset("MBCS");

	files
	{
		"%{prj.location}/include/**.h",
		"%{prj.location}/src/**.cpp",
		"%{prj.location}/**.lua"
	}

	includedirs
	{
		"%{prj.location}/include"
	}

	links
	{
	}

	filter "system:windows"
		cppdialect "C++latest"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"SPDLOG_COMPILED_LIB"
		}

		links
		{
		}

	filter "configurations:Debug"
		defines "ARCH_DEBUG"
		symbols "on"

	filter "configurations:Release"
		defines "ARCH_RELEASE"
		optimize "on"

	filter "configurations:Dist"
		defines "ARCH_DIST"
		optimize "on"
		symbols "off"
