# onedrive-sdk-discovery-service-problem-minimal-repro
Minimal Repro for Problem with Discovery Service Deprecation using https://github.com/OneDrive/onedrive-sdk-ios with OneDrive for Business

Microsoft have deprecated the old discovery service and moved to using Graph API:

https://developer.microsoft.com/en-us/office/blogs/migrating-from-the-office-365-discovery-service-to-microsoft-graph-to-discover-a-sharepoint-root-site/

The OneDrive SDK at https://github.com/OneDrive/onedrive-sdk-ios does not account for this as of now. This is a minimal reproduction project to demonstrate the issue.

-Mark
