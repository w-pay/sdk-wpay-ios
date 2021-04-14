import UIKit

public protocol PaymentAgreementApiRepository {
	/**
	 Create a new payment agreement which will be added to the users wallet after validating the payment instrument.

	 This API is IP restricted to allow unauthenticated server side calls.

	 - Parameter paymentAgreementRequest: detail of payment agreement to be created
	 */
	func create(
		paymentAgreementRequest: DigitalPayCreatePaymentAgreementRequest,
		completion: @escaping ApiCompletion<DigitalPayPaymentAgreementResponse>
	)

	/**
	 Update an existing payment agreement and validate the payment instrument if changed.

	 This API is IP restricted to allow unauthenticated server side calls.

	 - Parameter paymentToken: The payment agreement to update
	 - Parameter paymentAgreementRequest: detail of payment agreement to be updated
	 */
	func update(
		paymentToken: String,
		paymentAgreementRequest: DigitalPayUpdatePaymentAgreementRequest,
		completion: @escaping ApiCompletion<DigitalPayPaymentAgreementResponse>
	)

	/**
	 Perform charge transaction against a payment agreement.

	 This service will use the provided information to perform the charge transaction.

	 A charge payment is made by the merchant to charge a customer as per their payment agreement.

	 This API is IP restricted to allow unauthenticated server side calls.

	 - Parameter chargeRequest: detail of payment agreement to be charged
	 */
	func charge(
		chargeRequest: DigitalPayChargePaymentAgreementRequest,
		completion: @escaping ApiCompletion<DigitalPayPaymentAgreementResponse>
	)

	/**
	 Delete an existing payment agreement.

	 This API is IP restricted to allow unauthenticated server side calls.

	 - Parameter paymentToken: The payment agreement to delete
	 */
	func delete(paymentToken: String, completion: @escaping ApiCompletion<Void>)
}
