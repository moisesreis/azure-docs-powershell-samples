# Set the Azure resource group name and location
$resourceGroupName = "<resource-group-name>"
$resourceGroupLocation = "<resource-group-location>"

# Write and read locations and priorities for the database
$locations = @(@{"locationName"="<write-region-location>"; 
                 "failoverPriority"=0}, 
               @{"locationName"="<read-region-location-1>"; 
                  "failoverPriority"=1},
               @{"locationName"="<read-region-location-2";
                  "failoverPriority"=2},
               @{"locationName"="<read-region-location-3";
                  "failoverPriority"=3})

# IP addresses that can access the database through the firewall
$iprangefilter = "<ip-range-filter>"

# Consistency policy
$consistencyPolicy = @{"defaultConsistencyLevel"="<default-consistency-level>"; 
                       "maxIntervalInSeconds"="<max-interval>"; 
                       "maxStalenessPrefix"="<max-staleness-prefix>"}

# DB properties
$DBProperties = @{"databaseAccountOfferType"="Standard"; 
                          "locations"=$locations; 
                          "consistencyPolicy"=$consistencyPolicy; 
                          "ipRangeFilter"=$iprangefilter}

# Create the database
New-AzureRmResource -ResourceType "Microsoft.DocumentDb/databaseAccounts" `
                    -ApiVersion "2015-04-08" `
                    -ResourceGroupName $resourceGroupName `
                    -Location $resourceGroupLocation `
                    -Name "<database-account-name>" `
                    -PropertyObject $DBProperties
