solution "OpenMetaverse"
  configurations { "Debug", "Release" }
  framework "4.0"
  language "C#"
  warnings "Extra"
  disablewarnings {"1591", "1574", "0419", "0618"}
  buildoptions { "/checked-", "/nostdlib-", "/incremental"}
  targetdir "bin"
  implibdir "bin"

  configuration "Debug"
    defines { "TRACE", "DEBUG" }
    flags { "Symbols" }
    optimize "Off"
    clr "Unsafe"

  configuration "Release"
    defines { "TRACE" }
    optimize "Full"
    clr "Unsafe"

  --[[ External Libraries --]]

  project "CSJ2K"
    kind("SharedLib")
    location("CSJ2K")
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Drawing",
    }

  --[[ Libraries --]]

  project "OpenMetaverseTypes"
    kind("SharedLib")
    location("OpenMetaverseTypes")
    namespace("OpenMetaverse")
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Core",
    }
    configuration "Release"
      buildoptions {"/doc:OpenMetaverseTypes.xml"}

  project "OpenMetaverse.StructuredData"
    kind("SharedLib")
    location("OpenMetaverse.StructuredData")
    namespace("OpenMetaverse.StructuredData")
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Xml",
      "OpenMetaverseTypes",
    }
    configuration "Release"
      buildoptions {"/doc:OpenMetaverse.StructuredData.xml"}

  project "OpenMetaverse"
    kind("SharedLib")
    location("OpenMetaverse")
    namespace("OpenMetaverse")
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Core",
      "System.Xml",
      "System.Data",
      "System.Drawing",
      "OpenMetaverseTypes",
      "OpenMetaverse.StructuredData",
      "log4net",
      "XMLRPC",
      "zlib.net",
    }
    configuration "Release"
      buildoptions {"/doc:OpenMetaverse.xml"}

  project "OpenMetaverse.Utilities"
    kind("SharedLib")
    location("OpenMetaverse.Utilities")
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Xml",
      "System.Data",
      "OpenMetaverse",
      "OpenMetaverseTypes",
      "OpenMetaverse.StructuredData",
    }
    configuration "Release"
      buildoptions {"/doc:OpenMetaverse.Utilities.xml"}

  project "OpenMetaverse.Tests"
    kind("SharedLib")
    location("OpenMetaverse.Tests")
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Xml",
      "System.Data",
      "nunit.framework",
      "OpenMetaverse",
      "OpenMetaverseTypes",
      "OpenMetaverse.StructuredData",
    }

  project "GridProxy"
    kind("SharedLib")
    location(path.join("Programs", "GridProxy"))
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "GridProxyMain.cs"),
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Xml",
      "OpenMetaverse",
      "OpenMetaverseTypes",
      "OpenMetaverse.StructuredData",
      "XMLRPC",
      "log4net",
    }

  project "OpenMetaverse.Rendering.Simple"
    kind("SharedLib")
    location("OpenMetaverse.Rendering.Simple")
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Drawing",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }

  project "OpenMetaverse.Rendering.Meshmerizer"
    kind("SharedLib")
    location("OpenMetaverse.Rendering.Meshmerizer")
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Drawing",
      "OpenMetaverse",
      "OpenMetaverseTypes",
      "PrimMesher",
    }

  project "OpenMetaverse.GUI"
    kind("SharedLib")
    location("OpenMetaverse.GUI")
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Data",
      "System.Drawing",
      "System.Windows.Forms",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }
    configuration "Release"
      buildoptions {"/doc:OpenMetaverse.GUI.xml"}

  --[[ Programs --]]

  project "AvatarPreview"
    kind("WindowedApp")
    location(path.join("Programs", "AvatarPreview"))
    files {
      path.join("%{prj.location}", "**.cs"),
      path.join("%{prj.location}", "**.resx"),
      path.join("%{prj.location}", "**.settings"),
      path.join("%{prj.location}", "**.ico")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Xml",
      "System.Data",
      "System.Drawing",
      "System.Windows.Forms",
      "Tao.OpenGl",
      "Tao.Platform.Windows",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }

  project "Baker"
    kind("WindowedApp")
    location(path.join("Programs", "Baker"))
    files {
      path.join("%{prj.location}", "**.cs"),
      path.join("%{prj.location}", "**.resx"),
      path.join("%{prj.location}", "**.settings"),
      path.join("%{prj.location}", "**.ico")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Data",
      "System.Drawing",
      "System.Windows.Forms",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }

  project "importprimscript"
    kind("ConsoleApp")
    location(path.join("Programs", "importprimscript"))
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Drawing",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }

  project "mapgenerator"
    kind("ConsoleApp")
    location(path.join("Programs", "mapgenerator"))
    files {
      path.join("%{prj.location}", "mapgenerator.cs"),
      path.join("%{prj.location}", "ProtocolManager.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
    }

  project "IRCGateway"
    kind("ConsoleApp")
    location(path.join("Programs", "examples", "IRCGateway"))
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }

  project "Dashboard"
    kind("WindowedApp")
    location(path.join("Programs", "examples", "Dashboard"))
    files {
      path.join("%{prj.location}", "**.cs"),
      path.join("%{prj.location}", "**.resx"),
      path.join("%{prj.location}", "**.settings"),
      path.join("%{prj.location}", "**.ico")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Drawing",
      "System.Windows.Forms",
      "OpenMetaverse",
      "OpenMetaverseTypes",
      "OpenMetaverse.GUI",
    }

  --[[ // Sorry for the cruft, this is an in progress plugin for WGP that
       // will show a simulators objects in a tree view - Coming soon!
  project "ObjectTreeBrowser"
    kind("WindowedApp")
    location(path.join("Programs", "examples", "ObjectTreeBrowser"))
    files {
      path.join("%{prj.location}", "**.cs"),
      path.join("%{prj.location}", "**.resx"),
      path.join("%{prj.location}", "**.settings"),
      path.join("%{prj.location}", "**.ico")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Drawing",
      "System.Windows.Forms",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }
  --]]

  project "PrimWorkshop"
    kind("WindowedApp")
    location(path.join("Programs", "PrimWorkshop"))
    files {
      path.join("%{prj.location}", "**.cs"),
      path.join("%{prj.location}", "**.resx"),
      path.join("%{prj.location}", "**.settings"),
      path.join("%{prj.location}", "**.ico")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Xml",
      "System.Data",
      "System.Drawing",
      "System.Windows.Forms",
      "Tao.OpenGl",
      "Tao.Platform.Windows",
      "GlacialList",
      "ICSharpCode.SharpZipLib",
      "OpenMetaverse",
      "OpenMetaverseTypes",
      "OpenMetaverse.StructuredData",
    }

  project "GridImageUpload"
    kind("WindowedApp")
    location(path.join("Programs", "GridImageUpload"))
    files {
      path.join("%{prj.location}", "**.cs"),
      path.join("%{prj.location}", "**.resx"),
      path.join("%{prj.location}", "**.settings"),
      path.join("%{prj.location}", "**.ico")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Data",
      "System.Drawing",
      "System.Windows.Forms",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }

  project "GridProxyApp"
    kind("ConsoleApp")
    location(path.join("Programs", "GridProxy"))
    files {
      path.join("%{prj.location}", "GridProxyMain.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Xml",
      "GridProxy",
      "OpenMetaverseTypes",
    }

  project "WinGridProxy"
    kind("WindowedApp")
    location(path.join("Programs", "WinGridProxy"))
    files {
      path.join("%{prj.location}", "**.cs"),
      path.join("%{prj.location}", "**.resx"),
      path.join("%{prj.location}", "**.settings"),
      path.join("%{prj.location}", "**.ico")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Core",
      "System.Xml",
      "System.Data",
      "System.Drawing",
      "System.Windows.Forms",
      "OpenMetaverse",
      "OpenMetaverseTypes",
      "OpenMetaverse.StructuredData",
      "GridProxy",
      "XMLRPC",
      "Be.Windows.Forms.HexBox",
      "log4net",
    }

--[[
  project "GridProxyGUI"
    kind("WindowedApp")
    platforms { "x86" }
    location(path.join("Programs", "GridProxyGUI"))
    icon("libomv.ico")
    files {
      path.join("%{prj.location}", "**.cs"),
      path.join("%{prj.location}", "**.resx"),
      path.join("%{prj.location}", "**.png"),
      path.join("%{prj.location}", "**.ico")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Xml",
      "System.Drawing",
      "System.Windows.Forms",
      "OpenMetaverse",
      "OpenMetaverseTypes",
      "OpenMetaverse.StructuredData",
      "GridProxy",
      "XMLRPC",
      "log4net",
      "atk-sharp",
      "gdk-sharp",
      "glade-sharp",
      "glib-sharp",
      "gtk-sharp",
      "pango-sharp",
      "Mono.Posix",
    }
    configuration "**.png"
      buildaction "Embeded"
--]]

  project "VisualParamGenerator"
    kind("ConsoleApp")
    location(path.join("Programs", "VisualParamGenerator"))
    files {
      path.join("%{prj.location}", "VisualParamGenerator.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Xml",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }

  project "VoiceTest"
    kind("ConsoleApp")
    location(path.join("Programs", "VoiceTest"))
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "OpenMetaverse",
      "OpenMetaverseTypes",
      "OpenMetaverse.Utilities",
    }

  --[[ Examples --]]

  project "groupmanager"
    kind("WindowedApp")
    location(path.join("Programs", "examples", "groupmanager"))
    files {
      path.join("%{prj.location}", "**.cs"),
      path.join("%{prj.location}", "**.resx"),
      path.join("%{prj.location}", "**.settings"),
      path.join("%{prj.location}", "**.ico")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Data",
      "System.Drawing",
      "System.Windows.Forms",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }

  project "Heightmap"
    kind("WindowedApp")
    location(path.join("Programs", "examples", "Heightmap"))
    files {
      path.join("%{prj.location}", "**.cs"),
      path.join("%{prj.location}", "**.resx"),
      path.join("%{prj.location}", "**.settings"),
      path.join("%{prj.location}", "**.ico")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Data",
      "System.Drawing",
      "System.Windows.Forms",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }

  project "GridAccountant"
    kind("WindowedApp")
    location(path.join("Programs", "examples", "GridAccountant"))
    files {
      path.join("%{prj.location}", "**.cs"),
      path.join("%{prj.location}", "**.resx"),
      path.join("%{prj.location}", "**.settings"),
      path.join("%{prj.location}", "**.ico")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Data",
      "System.Drawing",
      "System.Windows.Forms",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }

  project "PacketDump"
    kind("ConsoleApp")
    location(path.join("Programs", "examples", "PacketDump"))
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "OpenMetaverse",
      "OpenMetaverseTypes",
    }

  project "TestClient"
    kind("ConsoleApp")
    location(path.join("Programs", "examples", "TestClient"))
    files {
      path.join("%{prj.location}", "**.cs")
    }
    excludes {
      path.join("%{prj.location}", "obj", "**")
    }
    links {
      "System",
      "System.Xml",
      "System.Web",
      "System.Drawing",
      "OpenMetaverse",
      "OpenMetaverseTypes",
      "OpenMetaverse.Utilities",
      "OpenMetaverse.StructuredData",
    }
