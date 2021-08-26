#Script to install NET48 and VS2019 Community without helpers

$vsCommUrl = "https://aka.ms/vs/16/release/vs_community.exe"

$downloadPath = "C:\"
$filePath = "C:\vs_community.exe"
Invoke-WebRequest -URI $vsCommUrl -OutFile $filePath

$workloadArgument = @(
    '--add Component.Dotfuscator'
    '--add Microsoft.Component.VC.Runtime.UCRTSDK'
    '--add Microsoft.Net.ComponentGroup.4.6.2.DeveloperTools'
    '--add Microsoft.Net.ComponentGroup.4.7.1.DeveloperTools'
    '--add Microsoft.Net.ComponentGroup.4.7.DeveloperTools'
    '--add Microsoft.Net.ComponentGroup.4.8.DeveloperTools'
    '--add Microsoft.Net.Component.4.7.2.SDK'
    '--add Microsoft.Net.Component.4.8.SDK'
    '--add Microsoft.Net.Component.4.7.2.TargetingPack'
    '--add Microsoft.Net.Component.4.8.TargetingPack'
    '--add Microsoft.VisualStudio.Component.AspNet45'
    '--add Microsoft.VisualStudio.Component.DslTools'
    '--add Microsoft.VisualStudio.Component.EntityFramework'
    '--add Microsoft.VisualStudio.Component.FSharp.Desktop'
    '--add Microsoft.VisualStudio.Component.Sharepoint.Tools'
    '--add Microsoft.VisualStudio.Component.PortableLibrary'
    '--add Microsoft.VisualStudio.Component.TeamOffice'
    '--add Microsoft.VisualStudio.Component.TestTools.CodedUITest'
    '--add Microsoft.VisualStudio.Component.TestTools.WebLoadTest'
    '--add Microsoft.VisualStudio.Component.UWP.VC.ARM64'
    '--add Microsoft.VisualStudio.Component.VC.140'
    '--add Microsoft.VisualStudio.Component.VC.ATL.ARM'
    '--add Microsoft.VisualStudio.Component.VC.ATLMFC'
    '--add Microsoft.VisualStudio.Component.VC.ATLMFC.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.CLI.Support'
    '--add Microsoft.VisualStudio.Component.VC.CMake.Project'
    '--add Microsoft.VisualStudio.Component.VC.DiagnosticTools'
    '--add Microsoft.VisualStudio.Component.VC.Llvm.ClangToolset'
    '--add Microsoft.VisualStudio.Component.VC.MFC.ARM'
    '--add Microsoft.VisualStudio.Component.VC.MFC.ARM.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.MFC.ARM64'
    '--add Microsoft.VisualStudio.Component.VC.MFC.ARM64.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.Redist.MSM'
    '--add Microsoft.VisualStudio.Component.VC.Runtimes.ARM.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.Runtimes.ARM64.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.Runtimes.x86.x64.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.TestAdapterForBoostTest'
    '--add Microsoft.VisualStudio.Component.VC.TestAdapterForGoogleTest'
    '--add Microsoft.VisualStudio.Component.VC.v141.x86.x64'
    '--add Microsoft.VisualStudio.Component.VC.v141.x86.x64.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.v141.ARM.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.v141.ARM64.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.v141.ATL'
    '--add Microsoft.VisualStudio.Component.VC.v141.ATL.ARM.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.v141.ATL.ARM64.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.v141.ATL.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.v141.MFC'
    '--add Microsoft.VisualStudio.Component.VC.v141.MFC.ARM.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.v141.MFC.ARM64.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.v141.MFC.Spectre'
    '--add Microsoft.VisualStudio.Component.VC.14.25.x86.x64'
    '--add Microsoft.VisualStudio.Component.Windows10SDK.16299'
    '--add Microsoft.VisualStudio.Component.Windows10SDK.17134'
    '--add Microsoft.VisualStudio.Component.Windows10SDK.17763'
    '--add Microsoft.VisualStudio.Component.Windows10SDK.18362'
    '--add Microsoft.VisualStudio.Component.Windows10SDK.19041'
    '--add Microsoft.VisualStudio.Component.Workflow'
    '--add Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Llvm.Clang'
    '--add Microsoft.VisualStudio.ComponentGroup.Web.CloudTools'
    '--add Microsoft.VisualStudio.ComponentGroup.UWP.VC'
    '--add Microsoft.VisualStudio.ComponentGroup.UWP.VC.v141'
    '--add Microsoft.VisualStudio.Workload.Data'
    '--add Microsoft.VisualStudio.Workload.DataScience'
    '--add Microsoft.VisualStudio.Workload.ManagedDesktop'
    '--add Microsoft.VisualStudio.Workload.ManagedGame'
    '--add Microsoft.VisualStudio.Workload.NativeCrossPlat'
    '--add Microsoft.VisualStudio.Workload.NativeDesktop'
    '--add Microsoft.VisualStudio.Workload.NativeGame'
    '--add Microsoft.VisualStudio.Workload.NativeMobile'
    '--add Microsoft.VisualStudio.Workload.NetCoreTools'
    '--add Microsoft.VisualStudio.Workload.NetCrossPlat'
    '--add Microsoft.VisualStudio.Workload.NetWeb'
    '--add Microsoft.VisualStudio.Workload.Node'
    '--add Microsoft.VisualStudio.Workload.Universal'
    '--add Microsoft.VisualStudio.Workload.VisualStudioExtension'
)

$optionsAddLayout          = [string]::Join(" ", $workloadArgument )
$optionsQuiet              = "--quiet"
$optionsLayout             = "--layout $downloadPath"
$optionsIncludeRecommended = "--includeRecommended"

$vsOptions = @(
    $optionsLayout,
    $optionsIncludeRecommended,
    $optionsAddLayout
    $optionsQuiet
)

Start-Process -FilePath $filePath update -ArgumentList $vsOptions -Wait
Start-Sleep -s 5
Restart-Computer