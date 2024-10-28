# Work in Progress
# Unifi Client

A swift client for the Unifi API.
                    
Basing this on the Unifi API Documentation provided on this site: [ubntwiki](https://ubntwiki.com/products/software/unifi-controller/api)

## Tests
There currently are no tests for the client. Still working through developing the client.

## Client
Work has been slow as I constantly get 403 errors with the client when attempting to authenticate. Found out this is a protection call `X-Xss-Protection`. 
After a few hours, I run the same code and I get a 200 success. Not sure the cause just yet but I hope it is something dumb I am doing. 
When I try a curl of the same information, I get a 200 response even after getting a 403 from the swift client.  

## Usage
**Warning** I have only tested this on a cli project, not a swiftUI project. While it should still work, I dont have any testing on it.  

Currently it only accepts sites with a fully qualified domain name and valid certificate. The Url must start with "https://".
It also only has a method for getting devices. This will be expanded upon slowly as I get those 403 errors previously mentioned will be mostly testing from curl and guestimating the swift from there. As most of it should follow a fairly standard response in json. It shouldnt be too difficult for the GET endpoints. The commands, will be another thing all together. I will also be using this [python unifi api client](https://github.com/nickovs/unificontrol) as reference. 

```
let site = "default"
let url = "https://your.fqdn.site"
let auth = BasicAuth(username: "your username", password: "your password")
let unifiClient = await UnifiClient(url: url, basicAuth: auth)
do {
    guard let result = try await unifiClient.devices(site: site) else { return }
    loggerMain.info("Success getting devices")
    print(result)
} catch {
    print(error)
}
```
