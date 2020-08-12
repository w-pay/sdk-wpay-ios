import UIKit

public class StoringApiAuthenticator<T>: AnyApiAuthenticator<T> {
	private let delegate: AnyApiAuthenticator<T>
	private let store: AnyCredentialsStore<T>

	public init(delegate: AnyApiAuthenticator<T>, store: AnyCredentialsStore<T>) {
		self.delegate = delegate
		self.store = store
	}

	override public func authenticate(callback: @escaping ApiResult<T>) -> Void {
		delegate.authenticate(callback: { results, error in
			if (results != nil) {
				self.store.storeCredentials(credentials: results!)
			}

			callback(results, error)
		})
	}

	override public func setHost(host: String) {
		delegate.setHost(host: host)
	}
}
