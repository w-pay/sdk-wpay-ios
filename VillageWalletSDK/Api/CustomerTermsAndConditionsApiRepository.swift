import UIKit

public protocol CustomerTermsAndConditionsApiRepository {
	/**
	 Get the terms and conditions agreed to by the customer

	 - Parameter type: The type of Ts and Cs that the shopper/customer has agreed to. Defaults to all if absent
	 - Parameter version: The version of Ts and Cs that the shopper/customer has agreed to.  Defaults to all if absent
	 */
	func get(
		type: String?,
		version: String?,
		completion: @escaping ApiCompletion<TermsAndConditionsAcceptances>
	)

	/**
	 Customer accepts terms and conditions"

	 - Parameter type: The type of Ts and Cs that the shopper/customer has agreed to. Defaults to all if absent
	 */
	func accept(
		acceptTermsAndConditionsRequest: AcceptTermsAndConditionsRequest,
		completion: @escaping ApiCompletion<Void>
	)
}
