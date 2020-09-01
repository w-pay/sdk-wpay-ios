import UIKit

public typealias CustomerPreferences = [String: [String: String]]

/**
 * Defines the low level API operations that the SDK can use to call the Customer Village API
 */
public protocol VillageCustomerApiRepository: VillageAdministrationApiRepository {
	func retrieveTransactions(
		paymentRequestId: String?,
		page: Int?,
		pageSize: Int?,
		endTime: Date?,
		startTime: Date?,
		completion: @escaping ApiCompletion<CustomerTransactionSummaries>
	)

	func retrieveTransactionDetails(
		transactionId: String,
		completion: @escaping ApiCompletion<CustomerTransactionDetails>
	)

	func retrievePaymentRequestDetailsBy(
		qrCodeId: String,
		completion: @escaping ApiCompletion<CustomerPaymentRequest>
	)

	func retrievePaymentRequestDetailsBy(
		paymentRequestId: String,
		completion: @escaping ApiCompletion<CustomerPaymentRequest>
	)

	/**
	 * @param wallet When set to MERCHANT retrieves only from merchant wallet. EVERYDAY_PAY retrieves both merchant and everyday pay wallet instruments.
	 */
	func retrievePaymentInstruments(
		wallet: Wallet,
		completion: @escaping ApiCompletion<AllPaymentInstruments>
	)

	func deletePaymentInstrument(
		instrument: PaymentInstrumentIdentifier,
		completion: @escaping ApiCompletion<Void>
	)

	func makePayment(
		paymentRequestId: String,
		primaryInstrument: PaymentInstrumentIdentifier,
		secondaryInstruments: [SecondaryPaymentInstrument]?,
		clientReference: String?,
		challengeResponses: [ChallengeResponse]?,
		completion: @escaping ApiCompletion<CustomerTransactionSummary>
	)
	
	func initiatePaymentInstrumentAddition(
		instrument: PaymentInstrumentAddition,
		completion: @escaping ApiCompletion<PaymentInstrumentAdditionResult>
	)

	func retrievePreferences(completion: @escaping ApiCompletion<CustomerPreferences>)

	func setPreferences(
		preferences: CustomerPreferences,
		completion: @escaping ApiCompletion<Void>
	)

	func retrievePaymentSessionBy(
		paymentSessionId: String,
		completion: @escaping ApiCompletion<PaymentSession>
	)

	func retrievePaymentSessionBy(
		qrCodeId: String,
		completion: @escaping ApiCompletion<PaymentSession>
	)

	func updatePaymentSession(
		paymentSessionId: String,
		session: CustomerUpdatePaymentSessionRequest,
		completion: @escaping ApiCompletion<Void>
	)
}
