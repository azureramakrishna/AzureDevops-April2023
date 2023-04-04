#Login-AzAccount 

#New-AzResourceGroup -Name "ARMTemplates" -Location "EastUS"

New-AzResourceGroupDeployment -ResourceGroupName "ARMTemplates" -TemplateFile ./template.json -TemplateParameterFile ./parameters.json -Verbose