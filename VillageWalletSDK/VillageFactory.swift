import UIKit

public enum ApiTokenType {
	case stringToken(token: String)
	case apiAuthenticatorToken(authenticator: AnyApiAuthenticator<HasAccessToken>)
	case noToken
}

/**
 Base factory function that can be used to create components needed for an SDK instance.

 - Parameter options:
 - Parameter token: An ApiAuthenticator instance for obtaining an access token, or null.
 */
func createSDKComponents(
	options: VillageOptions,
	token: ApiTokenType
) -> ([RequestHeaderFactory], AnyApiAuthenticator<HasAccessToken>) {
	var factories: [RequestHeaderFactory] = [ ApiKeyRequestHeader(options: options) ]

	let (authenticator, bearerTokenRequestHeader) = createAuthentication(token: token)

	if let requestHeader = bearerTokenRequestHeader {
		factories.append(requestHeader)
	}

	return (factories, authenticator)
}

func createAuthentication(
	token: ApiTokenType
) -> (AnyApiAuthenticator<HasAccessToken>, BearerTokenRequestHeader?) {
	switch token {
		case .noToken: return (EmptyTokenApiAuthenticator(), nil)
		case .stringToken(let token): return (
			ProvidedTokenAuthenticator(token: token), BearerTokenRequestHeader(token: token)
		)
		case .apiAuthenticatorToken(let authenticator):
			let bearerTokenRequestHeader = BearerTokenRequestHeader()

			return (
				StoringApiAuthenticator(delegate: authenticator, store: bearerTokenRequestHeader),
				bearerTokenRequestHeader
			)
	}
}