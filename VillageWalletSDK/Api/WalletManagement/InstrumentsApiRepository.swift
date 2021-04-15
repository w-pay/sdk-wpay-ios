import UIKit

public protocol InstrumentsApiRepository {
	/**
	 Import a consumers credit cards (from WebPay) and paypal accounts to a new wallet. This API is IP restricted to allow unauthenticated server side calls.

	 - Parameter importPaymentInstrumentsRequest: Details of the consumers credits and paypal accounts to be imported.
	 */
	func importInstrument(
		importPaymentInstrumentsRequest: ImportPaymentInstrumentsRequest,
		completion: @escaping ApiCompletion<ImportPaymentInstrumentsResponse>
	)

	/**
	 Verify if a provided payment instrument is valid and optionally perform a fraud check on the instrument.

	 - Parameter verifyPaymentInstrumentsRequest: Details of the payment instrument to be verified.
	 */
	func verify(
		verifyPaymentInstrumentsRequest: VerifyPaymentInstrumentsRequest,
		completion: @escaping ApiCompletion<VerifyPaymentInstrumentsSuccessResponse>
	)

	/**
	 Get the stored payment intruments of a consumer.
	 */
	func getList(completion: @escaping ApiCompletion<ListPaymentInstrumentsResponse>)

	/**
	 Get the stored payment intruments of a consumer. This API is IP restricted to allow unauthenticated server side calls.

	 - Parameter listPaymentInstrumentsRequest: Details of the consumer to list payment instruments for.
	 */
	func postList(
		listPaymentInstrumentsRequest: ListPaymentInstrumentsRequest,
		completion: @escaping ApiCompletion<ListPaymentInstrumentsResponse>
	)

	/**
	 Delete a stored payment intrument of a consumer.

	 - Parameter paymentInstrumentId: The id of the payment instrument to delete.
	 */
	func delete(
		paymentInstrumentId: String,
	  completion: @escaping ApiCompletion<[String: Any]>
	)
}
