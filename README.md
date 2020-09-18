# Woolworths Village Wallet iOS SDK

This project contains a Framework that can facilitate iOS applications accessing the Village API.

The SDK is currently in development. Therefore parts may change.

## Features

The SDK is has the following core design philosophies.

1. Technology agnostic. Different applications may have different technology
choices and an SDK shouldn't force an application to depend on a different
technology stack as this bloats the build and increases complexity.

2. Swappable. Don't like a particular implementation of a part in the SDK, then
swap it out for another object that implements the correct protocol.

The SDK comprises of:
 - An adaption layer between the Application and the API
 - An API layer which knows how to communicate with the Village API
 - An authentication layer.

Applications have the flexibility to plug in different implementations of
the protocols to allow particular technology choices (eg: choice of
HTTP client library). This makes it very easy to use the SDK in an
existing project, without necessarily introducing extra dependencies.

The entry point for applications is the `CustomerVillage` class or
`MerchantVillage` class depending on the goals of the application.

### Authentication layer

In order to access protected APIs, the SDK will need to know how to
authenticate with the API or a gateway that protects the API. The
`ApiAuthenticator` protocol abstracts how the SDK authenticates from
the rest of the API protocol. Applications that have a preexisting
authentication workflow can either update the relevant classes to implement the
`ApiAuthenticator` protocol, or provide an [Adapter](https://en.wikipedia.org/wiki/Adapter_pattern#Java)
to make the existing authentication details available to the SDK.

### API layer

The API layer is decoupled from the rest of the SDK via the
`VillageCustomerApiRepository` and `VillageMerchantApiRepository`
protocols. Consumers need to configure their `Village` instance with
an implementation of the correct repository that conforms to needs and
technology choices of the application.

The SDK currently supports version 0.0.7 of the API spec.

#### Open API Implementation

For convenience, the [Woolworths Village SDK Open API Client](https://github.com/woolworthslimited/paysdk2-openapi-ios)
project provides an implementation of the API Repository protocols
that wraps an API Client created with the Open API generator.

#### Reference Application

A [Reference Application](https://github.com/woolworthslimited/paysdk2-reference-ios) is available
to demonstrate the use of the SDK. The Framework can be imported directly into a XCode project
or CocoaPods can be used. 

## Versioning

The SDK follows [Semantic Versioning](https://semver.org/) principles.
As such if the API specification changes in a way that introduces breaking
changes (eg: path change or data changes) the major version of the SDK
will be increased.

## Requirements

The SDK was developed using Xcode 11.5, Swift 5.2 and is compatible with apps targeting iOS 9.0 or above.

## Getting started

Read the [📘 SDK reference docs](/docs/index.html) for more information on the different types
in the SDK. 

### CocoaPods

If using [CocoaPods](https://cocoapods.org/) add the following to your Podfile

```
# substitute the tag for the version desired.
pod "VillageWalletSDK", :git => "git@github.com:woolworthslimited/paysdk2-ios.git", :tag => "v1.0.0"

# don't forget to include an implementation framework of the API repositories.
```

### Other

Clone the repo and add the project to your XCode workspace.

### Example usage

The examples use the Open API implementation, however any class conforming to the correct protocol
can be used

```swift
func createCustomerVillage() -> CustomerVillage<IdmTokenDetails> {
  let options = VillageOptions(apiKey: "<your key here>")
  let apiKeyRequestHeader = ApiKeyRequestHeader(options: options)
  let bearerTokenRequestHeader = BearerTokenRequestHeader<AuthDetails>()
  let api =
    OpenApiVillageCustomerApiRepository(
      requestHeadersFactory: RequestHeaderChain(
        factories: [
          apiKeyRequestHeader,
          bearerTokenRequestHeader,
          WalletIdRequestHeader()
        ]
      ),
      // TODO: This should be in a project property
      contextRoot: "/wow/v1/dpwallet"
    )

  /*
   * Currently the creation of the `ApiAuthenticator` has to be in the consuming
   * application.
   */
  let authenticator = createAuthenticator()

  let authentication = StoringApiAuthenticator(
    delegate: authenticator,
    store: bearerTokenRequestHeader
  )

  return CustomerVillage(api: api, authenticator: authentication)
}
```

The different methods on the SDK can be now used.

### Documentation

The SDK reference docs are generated using [Jazzy](https://github.com/realm/jazzy)

```
$ jazzy --config .jazzy.yml
```

## Publishing

Newer versions of the SDK are tagged in GitHub and thus can be used by either:
- Cloning the repo at the tagged version and integrating into XCode
- Downloading a ZIP of the repo at the tagged version and integrating into XCode
- Updating the tag in the Podfile