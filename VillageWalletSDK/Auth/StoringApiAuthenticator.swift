import UIKit

/**
	An `ApiAuthenticator` that stores credentials after successfully authenticating.
 */
public class StoringApiAuthenticator<T>: AnyApiAuthenticator<T> {
	private let delegate: AnyApiAuthenticator<T>
	private let store: AnyCredentialsStore<T>

	/**
		- Parameter delegate: An `ApiAuthenticator` that does the authentication.
		- Parameter store: A `CredentialsStore` for storing the credentials.
	 */
	public init(delegate: AnyApiAuthenticator<T>, store: AnyCredentialsStore<T>) {
		self.delegate = delegate
		self.store = store
	}

	/**
		- See: `ApiAuthenticator.authenticate(...)`
   */
	override public func authenticate(completion: @escaping ApiCompletion<T>) -> Void {
		delegate.authenticate(completion: { [weak self] result in
			if let credentials = try? result.get() {
				self?.store.storeCredentials(credentials: credentials)
			}

			completion(result)
		})
	}
}
