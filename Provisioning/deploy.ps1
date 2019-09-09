param (
    $Params
)

# Deploy the template
$pnpTemplatePath = "$PSScriptRoot\build\ais-provisioning-template.pnp"
Apply-PnPTenantTemplate -Path $pnpTemplatePath -Parameters $Params