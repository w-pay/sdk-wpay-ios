import UIKit

public class ProvidedTokenAuthenticator: AnyApiAuthenticator<HasAccessToken> {
	let token: String

	/** :nodoc */
	public init(token: String) {
		self.token = token

		super.init()
	}

	/**
		- See: `ApiAuthenticator.authenticate(...)`
   */
	public override func authenticate(completion: @escaping ApiCompletion<HasAccessToken>) {
		completion(.success(ProviderAccessToken(providedToken: token)))
	}
}

class ProviderAccessToken: HasAccessToken {
	private let providedToken: String

	/** :nodoc */
	init(providedToken: String) {
		self.providedToken = providedToken
	}

	var accessToken: String { self.providedToken }
}