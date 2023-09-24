# bootstrap
Contains resources that must exist and have manual configuration before the main deployment occurs.
Typical use case would be KeyVaults to store certificates which are manually imported, or other manually configured resources.

# company-product
Example directory which contains the cluster creation and a "feature" which depends on the cluster being created.
Typical use case would be a cluster being created for a business segment, and any dependent resources and applications being deployed to the cluster.