import UIKit

/**
 Dictionary of customer preferences.
 */
public typealias CustomerPreferences = [String: [String: String]]

/**
 Defines the API operations that the SDK can use to call the Customer Village API

 The SDK is technology agnostic with applications being able to choose an implementation that
 meets the needs and preexisting technology choices of the application.

 Implementations of the protocol may provide additional constraints on the user.
 */
public protocol VillageCustomerApiRepository: VillageAdministrationApiRepository {
	/**
		Retrieve a list of previously executed transactions for the customer.

		- Parameter paymentRequestId: If present, limits the list of transactions to those that relate to the payment request.
		- Parameter page: The page of results to return with 1 indicating the first page (defaults to 1).
		- Parameter pageSize: The number of records to return for this page (current default is 25)
		- Parameter endTime: If present, transactions newer than this time will not be returned.
		- Parameter startTime: If present, transactions older than this time will not be returned
	 */
	func retrieveTransactions(
		paymentRequestId: String?,
		page: Int?,
		pageSize: Int?,
		endTime: Date?,
		startTime: Date?,
		completion: @escaping ApiCompletion<CustomerTransactionSummaries>
	)

	/**
		Retrieve details about a specific transaction

		- Parameter transactionId: The transaction id
	 */
	func retrieveTransactionDetails(
		transactionId: String,
		completion: @escaping ApiCompletion<CustomerTransactionDetails>
	)

	/**
		Retrieve a `CustomerPaymentRequest` by a QR code ID associated to the request

		- Parameter qrCodeId: The QR Code ID.
	 */
	func retrievePaymentRequestDetailsBy(
		qrCodeId: String,
		completion: @escaping ApiCompletion<CustomerPaymentRequest>
	)

	/**
		Retrieve a `CustomerPaymentRequest` by its ID

		- Parameter paymentRequestId: The ID.
	 */
	func retrievePaymentRequestDetailsBy(
		paymentRequestId: String,
		completion: @escaping ApiCompletion<CustomerPaymentRequest>
	)

	/**
		Retrieve the customer's registered `PaymentInstruments`

		- Parameter wallet: Whether to return only instruments registered by the customer for the merchant, or for the merchant and Everyday Pay
	 */
	func retrievePaymentInstruments(
		wallet: Wallet,
		completion: @escaping ApiCompletion<AllPaymentInstruments>
	)

	/**
		Delete a `PaymentInstrument` from a `Wallet`

		- Parameter instrument: The payment instrument to delete.
	 */
	func deletePaymentInstrument(
		instrument: PaymentInstrumentIdentifier,
		completion: @escaping ApiCompletion<Void>
	)

	/**
		Make a payment for a `CustomerPaymentRequest`

		- Parameter paymentRequestId: The `CustomerPaymentRequest` to pay for.
		- Parameter primaryInstrument: The primary (or only) instrument to use to make the payment.
		- Parameter secondaryInstruments: Other payment instruments to use to split payment.
		- Parameter clientReference: An optional client reference to be associated with the transaction.
		- Parameter challengeResponses: Used when needing to complete challenge(s) to complete payment.
	 */
	func makePayment(
		paymentRequestId: String,
		primaryInstrument: PaymentInstrumentIdentifier,
		secondaryInstruments: [SecondaryPaymentInstrument]?,
		clientReference: String?,
		challengeResponses: [ChallengeResponse]?,
		completion: @escaping ApiCompletion<CustomerTransactionSummary>
	)

	/**
		Initiate the addition of a new `PaymentInstrument` for the customer.

		To complete the addition the customer will have to use the returned URL details to enter
		the instrument details.

		- Parameters instrument: Initial details to begin the addition workflow.
	 */
	func initiatePaymentInstrumentAddition(
		instrument: PaymentInstrumentAddition,
		completion: @escaping ApiCompletion<PaymentInstrumentAdditionResult>
	)

	/**
		Retrieve a customer's preferences
	 */
	func retrievePreferences(completion: @escaping ApiCompletion<CustomerPreferences>)

	/**
		Update the preferences for a customer

		- Parameter preferences: The preferences of the customer.
	 */
	func setPreferences(
		preferences: CustomerPreferences,
		completion: @escaping ApiCompletion<Void>
	)

	/**
		Retrieve a `PaymentSession` by it's ID

		- Parameter paymentSessionId: The payment session ID.
	 */
	func retrievePaymentSessionBy(
		paymentSessionId: String,
		completion: @escaping ApiCompletion<PaymentSession>
	)

	/**
		Retrieve a `PaymentSession` by a QR code ID associated to the session.

		- Parameter qrCodeId: The QR code ID.
	 */
	func retrievePaymentSessionBy(
		qrCodeId: String,
		completion: @escaping ApiCompletion<PaymentSession>
	)

	/**
		Update a `PaymentSession`

		- Parameter paymentSessionId: The payment session to update
		- Parameter session: The updates to apply to the session
	 */
	func updatePaymentSession(
		paymentSessionId: String,
		session: CustomerUpdatePaymentSessionRequest,
		completion: @escaping ApiCompletion<Void>
	)

	/**
		Delete a `PaymentSession`

		- Parameter paymentSessionId: The payment session to delete
	 */
	func deletePaymentSession(
		paymentSessionId: String,
		completion: @escaping ApiCompletion<Void>
	)

	/**
		Pre-approve payment for a `PaymentSession`

		- Parameter paymentSessionId: The `PaymentSession` to pre-approve payment for.
		- Parameter primaryInstrument: The primary (or only) instrument to use to make the payment.
		- Parameter secondaryInstruments: Other payment instruments to use to split payment.
		- Parameter clientReference: An optional client reference to be associated with the transaction.
		- Parameter challengeResponses: Used when needing to complete challenge(s) to complete payment.
	 */
	func preApprovePaymentSession(
		paymentSessionId: String,
		primaryInstrument: PaymentInstrumentIdentifier,
		secondaryInstruments: [SecondaryPaymentInstrument]?,
		clientReference: String?,
		challengeResponses: [ChallengeResponse]?,
		completion: @escaping ApiCompletion<Void>
	)
}
