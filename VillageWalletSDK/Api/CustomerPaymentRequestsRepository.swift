import UIKit

public protocol CustomerPaymentRequestsRepository {
	/**
	 Retrieve a `CustomerPaymentRequest` by its ID

	 - Parameter paymentRequestId: The ID.
	*/
	func getBy(
		paymentRequestId: String,
		completion: @escaping ApiCompletion<CustomerPaymentRequest>
	)

	/**
	 Retrieve a `CustomerPaymentRequest` by a QR code ID associated to the request

	 - Parameter qrCodeId: The QR Code ID.
	*/
	func getBy(
		qrCodeId: String,
		completion: @escaping ApiCompletion<CustomerPaymentRequest>
	)

	/**
	 Make a payment for a `CustomerPaymentRequest`

	 - Parameter paymentRequestId: The `CustomerPaymentRequest` to pay for.
	 - Parameter primaryInstrument: The primary (or only) instrument to use to make the payment. If not present then the primary instrument from the customer preferences will be used.
	 - Parameter secondaryInstruments: Other payment instruments to use to split payment.
	 - Parameter clientReference: An optional client reference to be associated with the transaction.
	 - Parameter preferences: Optional payment preferences.
	 - Parameter challengeResponses: Used when needing to complete challenge(s) to complete payment.
	 - Parameter fraudPayload Used to complete the fraud check
	 - Parameter transactionType  The transaction types to use for each instrument type.
   - Parameter allowPartialSuccess An optional flag allowing the consumer to indicate that a partial success will not trigger a failure and rollback
	*/
	func makePayment(
		paymentRequestId: String,
		primaryInstrument: String?,
		secondaryInstruments: [SecondaryPaymentInstrument]?,
		clientReference: String?,
		preferences: PaymentPreferences?,
		challengeResponses: [ChallengeResponse]?,
		fraudPayload: FraudPayload?,
		transactionType: PaymentTransactionType?,
		allowPartialSuccess: Bool?,
		completion: @escaping ApiCompletion<CustomerTransactionSummary>
	)

	/**
	 Create a new `CustomerPaymentRequest` and immediately make a charge against it

	 - Parameter immediatePaymentRequest Details of the payment being made
	 - Parameter challengeResponses Used when needing to complete challenge(s) to complete payment.
	 - Parameter fraudPayload Used to complete the fraud check.
	*/
	func makeImmediatePayment(
		immediatePaymentRequest: ImmediatePaymentRequest,
		challengeResponses: [ChallengeResponse]?,
		fraudPayload: FraudPayload?,
		completion: @escaping ApiCompletion<CustomerTransactionSummary>
	)
}