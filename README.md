# Work in Progress
# Unifi Client

A swift client for the Unifi API.
                    
Basing this on the Unifi API Documentation provided on their site: [unifi](https://developer.ui.com/unifi-api/gettingstarted/)

## Tests
There currently are no tests for the client. Still working through developing the client.

## Client
 

## Usage 

```
let unifiClient = await UnifiClient(apikey: yourkey)
do {
    guard let result = try await unifiClient.getHosts() else { return }
    for host in response {
        print(host.id!)
    }
} catch {
    print(error)
}
```
