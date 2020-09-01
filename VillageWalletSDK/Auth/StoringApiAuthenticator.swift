import UIKit

public class StoringApiAuthenticator<T>: AnyApiAuthenticator<T> {
	private let delegate: AnyApiAuthenticator<T>
	private let store: AnyCredentialsStore<T>

	public init(delegate: AnyApiAuthenticator<T>, store: AnyCredentialsStore<T>) {
		self.delegate = delegate
		self.store = store
	}

	override public func authenticate(completion: @escaping ApiCompletion<T>) -> Void {
		delegate.authenticate(completion: { result in
			if let credentials = try? result.get() {
				self.store.storeCredentials(credentials: credentials)
			}

			completion(result)
		})
	}

	override public func setHost(host: String) {
		delegate.setHost(host: host)
	}
}
