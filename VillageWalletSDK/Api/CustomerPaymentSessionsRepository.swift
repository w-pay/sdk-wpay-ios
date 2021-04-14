import UIKit

public protocol CustomerPaymentSessionsRepository {
	/**
	 Retrieve a `PaymentSession` by it's ID

	 - Parameter paymentSessionId: The payment session ID.
	 */
	func getBy(paymentSessionId: String, completion: @escaping ApiCompletion<PaymentSession>)

	/**
	 Retrieve a `PaymentSession` by a QR code ID associated to the session.

	 - Parameter qrCodeId: The QR code ID.
	 */
	func getBy(qrCodeId: String, completion: @escaping ApiCompletion<PaymentSession>)

	/**
	 Update a `PaymentSession`

	 - Parameter paymentSessionId: The payment session to update
	 - Parameter session: The updates to apply to the session
	 */
	func update(
		paymentSessionId: String,
		session: CustomerUpdatePaymentSessionRequest,
		completion: @escaping ApiCompletion<PaymentSession>
	)

	/**
	 Delete a `PaymentSession`

	 - Parameter paymentSessionId: The payment session to delete
	 */
	func delete(paymentSessionId: String, completion: @escaping ApiCompletion<Void>)

	/**
	 Pre-approve payment for a `PaymentSession`

	 - Parameter paymentSessionId: The `PaymentSession` to pre-approve payment for.
	 - Parameter primaryInstrument: The primary (or only) instrument to use to make the payment. If not present then the primary instrument from the customer preferences will be used.
	 - Parameter secondaryInstruments: Other payment instruments to use to split payment.
	 - Parameter clientReference: An optional client reference to be associated with the transaction.
	 - Parameter preferences: Optional payment preferences.
	 - Parameter challengeResponses: Used when needing to complete challenge(s) to complete payment.
	 */
	func preApprove(
		paymentSessionId: String,
		primaryInstrument: String?,
		secondaryInstruments: [SecondaryPaymentInstrument]?,
		clientReference: String?,
		preferences: PaymentPreferences?,
		challengeResponses: [ChallengeResponse]?,
		completion: @escaping ApiCompletion<Void>
	)
}