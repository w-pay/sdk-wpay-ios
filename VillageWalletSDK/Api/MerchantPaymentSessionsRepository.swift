import UIKit

public protocol MerchantPaymentSessionsRepository {
	/**
	 Create a new `PaymentSession`

	 - Parameter request: The details for the new session.
	 */
	func create(
		request: CreatePaymentSessionRequest,
		completion: @escaping ApiCompletion<CreatePaymentSessionResult>
	)

	/**
	 Retrieve a `PaymentSession`

	 - Parameter paymentSessionId: The ID of the payment session to retrieve.
	 */
	func getBy(paymentSessionId: String, completion: @escaping ApiCompletion<PaymentSession>)

	/**
	 Update a `PaymentSession`

	 - Parameter paymentSessionId: The payment session to update
	 - Parameter session: The details to update the session with
	 */
	func update(
		paymentSessionId: String,
		session: MerchantUpdatePaymentSessionRequest,
		completion: @escaping ApiCompletion<Void>
	)

	/**
	 Delete a `PaymentSession`

	 - Parameter paymentSessionId: The payment session to delete.
	 */
	func delete(
		paymentSessionId: String,
		completion: @escaping ApiCompletion<Void>
	)
}