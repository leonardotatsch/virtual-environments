Describe "Git" {
    $gitTools = 'bash', 'awk', 'git', 'git-lfs'
    $gitTestCases = $gitTools | ForEach-Object {
        @{
            toolName = $_
            source = [regex]::Escape("$env:ProgramFiles\Git")
        }
    }

    It "Toolname '<toolName>' is installed" -TestCases $gitTestCases {
        "$toolName --version" | Should -ReturnZeroExitCode
    }

    It "ToolName '<toolName>' is located in '<source>'" -TestCases $gitTestCases {
        (Get-Command -Name $toolName).Source | Should -Match $source
    }

    It "ToolName 'hub' is installed" {
        "hub --version" | Should -ReturnZeroExitCode
    }

    It "Git core.symlinks=true option is enabled" {
        git config core.symlinks | Should -BeExactly true
    }

    It "GCM_INTERACTIVE environment variable should be equal Never" {
        $env:GCM_INTERACTIVE | Should -BeExactly Never
    }
}

Describe "GitVersion" {
    It "gitversion is installed" {
        "gitversion /version" | Should -ReturnZeroExitCode
    }
}