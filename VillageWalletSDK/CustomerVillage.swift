import UIKit

/**
 Entry point into the SDK for customers. It is responsible for managing the relationship between
 the app concerns, and calling the API.

 - Parameter A: The type of authentication details
 */
public class CustomerVillage<A>: Configurable {
	private let api: VillageCustomerApiRepository
	private let authenticator: AnyApiAuthenticator<A>

	/**
		- Parameter api: The API repository to use
		- Parameter authenticator: The `ApiAuthenticator` to use to obtain authorisation needed to access the API
	 */
	public init(api: VillageCustomerApiRepository, authenticator: AnyApiAuthenticator<A>) {
		self.api = api
		self.authenticator = authenticator
	}

	/**
		Used to have the SDK authenticate with the API.
	 */
	public func authenticate(completion: @escaping ApiCompletion<A>) {
		return authenticator.authenticate(completion: completion)
	}

	/**
		Retrieve a `CustomerPaymentRequest` by the QR code ID associated to the request

		- Parameter qrCodeId: The QR code ID
	 */
	public func retrievePaymentRequestDetailsBy(
		qrCodeId: String,
		completion: @escaping ApiCompletion<CustomerPaymentRequest>
	) -> Void {
		api.retrievePaymentRequestDetailsBy(
			qrCodeId: qrCodeId,
			completion: completion
		)
	}

	/**
		Retrieve the customer's registered `PaymentInstruments`

		- Parameter wallet: Whether to return only instruments registered by the customer for the merchant, or for the merchant and Everyday Pay
	 */
	public func retrievePaymentInstruments(
		wallet: Wallet,
		completion: @escaping ApiCompletion<AllPaymentInstruments>
	) -> Void {
		api.retrievePaymentInstruments(wallet: wallet, completion: completion)
	}

	/**
		Make a payment for a `CustomerPaymentRequest`

		- Parameter paymentRequestId: The `CustomerPaymentRequest` to pay for.
		- Parameter instrument: The primary (or only) instrument to use to make the payment.
		- Parameter secondaryInstruments: Other payment instruments to use to split payment.
		- Parameter clientReference: An optional client reference to be associated with the transaction.
		- Parameter challengeResponses: Used when needing to complete challenge(s) to complete payment.
	 */
	public func makePayment(
		paymentRequestId: String,
		instrument: PaymentInstrumentIdentifier,
		secondaryInstruments: [SecondaryPaymentInstrument]?,
		clientReference: String?,
		challengeResponses: [ChallengeResponse]?,
		completion: @escaping ApiCompletion<CustomerTransactionSummary>
	) {
		api.makePayment(
			paymentRequestId: paymentRequestId,
			primaryInstrument: instrument,
			secondaryInstruments: secondaryInstruments,
			clientReference: clientReference,
			challengeResponses: challengeResponses,
			completion: completion
		)
	}

	/**
		Retrieve a `PaymentSession` by it's ID

		- Parameter paymentSessionId: The ID of the session
	 */
	public func retrievePaymentSessionBy(
		paymentSessionId: String,
		completion: @escaping ApiCompletion<PaymentSession>
	) {
		api.retrievePaymentSessionBy(
			paymentSessionId: paymentSessionId,
			completion: completion
		)
	}

	/**
		Retrieve a `PaymentSession` by a QR code ID associated to the session

		- Parameter qrCodeId: The QR code ID
	 */
	public func retrievePaymentSessionBy(
		qrCodeId: String,
		completion: @escaping ApiCompletion<PaymentSession>
	) {
		api.retrievePaymentSessionBy(
			qrCodeId: qrCodeId,
			completion: completion
		)
	}

	/**
		Delete a `PaymentSession`

		- Parameter paymentSessionId: The payment session ID
	 */
	public func deletePaymentSession(
		paymentSessionId: String,
		completion: @escaping ApiCompletion<Void>
	) {
		api.deletePaymentSession(
			paymentSessionId: paymentSessionId,
			completion: completion
		)
	}

	/**
		Pre-approve payment for a `PaymentSession`

		- Parameter paymentSessionId: The `PaymentSession` to pre-approve payment for.
		- Parameter primaryInstrument: The primary (or only) instrument to use to make the payment.
		- Parameter secondaryInstruments: Other payment instruments to use to split payment.
		- Parameter clientReference: An optional client reference to be associated with the transaction.
		- Parameter challengeResponses: Used when needing to complete challenge(s) to complete payment.
	 */
	public func preApprovePaymentSession(
		paymentSessionId: String,
		primaryInstrument: PaymentInstrumentIdentifier,
		secondaryInstruments: [SecondaryPaymentInstrument]?,
		clientReference: String?,
		challengeResponses: [ChallengeResponse]?,
		completion: @escaping ApiCompletion<Void>
	) {
		api.preApprovePaymentSession(
			paymentSessionId: paymentSessionId,
			primaryInstrument: primaryInstrument,
			secondaryInstruments: secondaryInstruments,
			clientReference: clientReference,
			challengeResponses: challengeResponses,
			completion: completion
		)
	}

	/**
		Retrieve a list of previously executed transactions for the customer.

		- Parameter paymentRequestId: If present, limits the list of transactions to those that relate to the payment request.
		- Parameter page: The page of results to return with 1 indicating the first page (defaults to 1).
		- Parameter pageSize: The number of records to return for this page (current default is 25)
		- Parameter endTime: If present, transactions newer than this time will not be returned.
		- Parameter startTime: If present, transactions older than this time will not be returned
	 */
	public func retrieveTransactions(
		paymentRequestId: String?,
		page: Int?,
		pageSize: Int?,
		endTime: Date?,
		startTime: Date?,
		completion: @escaping ApiCompletion<CustomerTransactionSummaries>
	) {
		api.retrieveTransactions(
			paymentRequestId: paymentRequestId,
			page: page,
			pageSize: pageSize,
			endTime: endTime,
			startTime: startTime,
			completion: completion
		)
	}

	/**
		Allows the application to change the host the SDK sends API requests too.

		This allows the application to read data from an outside source (eg: a QR code) and have
		the SDK use the same host.

		- See: `Configurable.setHost(...)`
	 */
	public func setHost(host: String) {
		api.setHost(host: host)
		authenticator.setHost(host: host)
	}
}
