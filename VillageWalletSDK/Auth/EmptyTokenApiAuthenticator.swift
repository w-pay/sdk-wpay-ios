import UIKit

public class EmptyTokenApiAuthenticator: AnyApiAuthenticator<HasAccessToken> {
	/** :nodoc */
	public override init() {

	}

	/**
		- See: `ApiAuthenticator.authenticate(...)`
   */
	public override func authenticate(completion: @escaping ApiCompletion<HasAccessToken>) {
		completion(.success(EmptyAccessToken()))
	}
}

class EmptyAccessToken: HasAccessToken {
	var accessToken: String { "" }
}
