import UIKit

/**
	Abstracts how the SDK authenticates with the API.

	If an application has an existing authentication/authorisation workflow then an Adapter class
	can be used to integrate that workflow into the SDK to provide the necessary authentication
 */
public protocol ApiAuthenticator {
	/** The type of authentication details */
	associatedtype T

	/**
		Called by the SDK to obtain authentication details eg: an access token
	 */
	func authenticate(completion: @escaping ApiCompletion<T>) -> Void
}

/**
 Needed to be able to implement Decorators with generic Protocols

 - See: https://stackoverflow.com/questions/62650193/implement-decorator-pattern-with-generics-in-swift
 */
open class AnyApiAuthenticator<T>: ApiAuthenticator {
	/** :nodoc */
	public init() {

	}

	/**
		- See: `ApiAuthenticator.authenticate(...)`
   */
	open func authenticate(completion: @escaping ApiCompletion<T>) {
		fatalError("Must implement")
	}
}
