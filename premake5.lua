project "ImGui"
	kind "SharedLib"
    language "C++"
    staticruntime "off"

    targetname ("%{wks.name}-%{prj.name}")
    targetprefix ("")

	targetdir (BinaryOutputDirectory)
	objdir (IntermediateOutputDirectory)

	files {
        "premake5.lua",

        "imconfig.h",
        "imgui.h",
        "imgui_internal.h",

        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",

        "imgui.cpp",
        "imgui_demo.cpp",
        "imgui_draw.cpp",
        "imgui_widgets.cpp"
	}

    filter "system:windows"
        systemversion "latest"

        defines {
            "IMGUI_API=__declspec(dllexport)"
        }

    filter "system:linux"
        systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
	
	filter "configurations:Distribution"
		runtime "Release"
		optimize "On"
		inlining "Auto"