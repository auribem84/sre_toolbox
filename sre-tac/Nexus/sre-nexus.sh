# Nexus login 
docker login registry.eng.trueaccord.com

# Search for your credentials at nexus UI. 
# > Click on your user account in the top right > Select User Token in the left > Access User Token > Copy token name and password.

# Pull chart in tgz format to your OCI
helm push consul-1.7.2.tgz oci://registry.eng.trueaccord.com/trueaccord/consul/