import UIKit

/**
	Adds a 'Bearer' token to the request.
 */
public class BearerTokenRequestHeader<T: HasAccessToken>: AnyCredentialsStore<T>, RequestHeaderFactory {
	private var token: String?

	public override init() {

	}

	/**
		- See: `RequestHeaderFactory.addHeaders(...)`
   */
	public func addHeaders(headers: inout [String: String]) {
		guard let token = self.token else {
			fatalError("Must set bearer token before calling API")
		}

		headers["Authorization"] = "Bearer \(token)"
	}

	/**
	  Stores authentication details to use tokens in API requests.

		- See: `CredentialsStore.storeCredentials(...)`

	  - Parameter credentials: The result of authenticating with the API.
	 */
	override public func storeCredentials(credentials: T) {
		token = credentials.accessToken
	}
}
