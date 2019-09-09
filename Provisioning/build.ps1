# Clean and create the output directory between runs.
$outputDirectory = "build"
$outputDirectoryPath = "$PSScriptRoot\$outputDirectory"
Remove-Item $outputDirectoryPath -Recurse -Confirm:$false -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path $outputDirectoryPath

# The provisioning engine needs the sppkg to be within the folder thats convernted to a pnp template.
# Copy the sppkg's to a location they can use them.
$templateRootFolder = "$PSScriptRoot\templates"
$sppkgDestinationFolder = "$templateRootFolder\apps"
$sppkgSourcePath = "$PSScriptRoot\..\SPFx\sharepoint\solution\ais-webpart.sppkg"

New-Item -ItemType Directory -Force -Path $sppkgDestinationFolder
Copy-Item $sppkgSourcePath -Destination $sppkgDestinationFolder

# Convert the folder to a pnp template
Convert-PnPFolderToProvisioningTemplate -Folder $templateRootFolder -Out "$outputDirectoryPath/ais-provisioning-template.pnp" -Force