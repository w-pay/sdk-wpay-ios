import UIKit

/**
 Abstracts how the SDK stores credentials obtained after authenticating with the API
 */
public protocol CredentialsStore {
	associatedtype T

	/**
	 Stores credentials for later use

	 - Parameter credentials: The credentials to store
	 */
	func storeCredentials(credentials: T) -> Void
}

/**
 Needed to be able to implement Decorators with generic Protocols

 - See: https://stackoverflow.com/questions/62650193/implement-decorator-pattern-with-generics-in-swift
 */
open class AnyCredentialsStore<T>: CredentialsStore {
	/** :nodoc */
	public init() {

	}

	/**
		- See: `CredentialsStore.storeCredentials(...)`
   */
	open func storeCredentials(credentials: T) {
		fatalError("Must implement")
	}
}
