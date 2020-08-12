import UIKit

public protocol ApiAuthenticator: Configurable {
	associatedtype T

	func authenticate(callback: @escaping ApiResult<T>) -> Void
}

/**
 * Needed to be able to implement Decorators
 * @see https://stackoverflow.com/questions/62650193/implement-decorator-pattern-with-generics-in-swift
 */
open class AnyApiAuthenticator<T>: ApiAuthenticator {
	public init() {

	}

	open func authenticate(callback: @escaping ApiResult<T>) {
		fatalError("Must implement")
	}

	open func setHost(host: String) {
		fatalError("Must implement")
	}
}
