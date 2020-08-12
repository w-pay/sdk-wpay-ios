import UIKit

public class BearerTokenRequestHeader: AnyCredentialsStore<IdmTokenDetails>, RequestHeaderFactory {
	private var token: String?

	public override init() {

	}

	public func addHeaders(headers: inout [String: String]) {
		guard let token = self.token else {
			fatalError("Must set bearer token before calling API")
		}

		headers["Authorization"] = "Bearer \(token)"
	}

	override public func storeCredentials(credentials: IdmTokenDetails) {
		token = credentials.accessToken
	}
}
