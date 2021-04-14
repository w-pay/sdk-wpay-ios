import UIKit

public protocol CustomerPaymentAgreementsApiRepository {
	/**
	 Retrieve a list of customer's [PaymentAgreement]s
	 */
	func list(completion: @escaping ApiCompletion<PaymentAgreements>)

	/**
	 Retrieve a [PaymentAgreement] by its associated payment token

	 - Parameter paymentToken: The ID.
	 */
	func getById(paymentToken: String, completion: @escaping ApiCompletion<PaymentAgreement>)

	/**
	 Create a [PaymentAgreement]

	 - Parameter paymentAgreement: The details for the new payment agreement
	 */
	func create(
		paymentAgreement: CreatePaymentAgreementRequest,
		completion: @escaping ApiCompletion<PaymentAgreement>
	)

	/**
	 Update a [PaymentAgreement]

	 - Parameter paymentToken: The payment token to update
	 - Parameter paymentAgreement: The updates to apply to the payment agreement
	 */
	func update(
		paymentToken: String,
		paymentAgreement: UpdatePaymentAgreementRequest,
		completion: @escaping ApiCompletion<PaymentAgreement>
	)
}
