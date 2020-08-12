import UIKit

public protocol CredentialsStore {
	associatedtype T

	func storeCredentials(credentials: T) -> Void
}

/**
 * Needed to be able to implement Decorators
 * @see https://stackoverflow.com/questions/62650193/implement-decorator-pattern-with-generics-in-swift
 */
open class AnyCredentialsStore<T>: CredentialsStore {
	public init() {

	}

	open func storeCredentials(credentials: T) {
		fatalError("Must implement")
	}
}
