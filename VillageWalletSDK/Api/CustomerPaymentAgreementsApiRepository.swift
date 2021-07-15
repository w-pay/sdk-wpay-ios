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
	 - Parameter challengeResponses Used when needing to complete challenge(s) to complete payment.
	 - Parameter fraudPayload Used to complete the fraud check
	 */
	func create(
		paymentAgreement: CreatePaymentAgreementRequest,
		challengeResponses: [ChallengeResponse]?,
		fraudPayload: FraudPayload,
		completion: @escaping ApiCompletion<PaymentAgreement>
	)

	/**
	 Update a [PaymentAgreement]

	 - Parameter paymentToken: The payment token to update
	 - Parameter paymentAgreement: The updates to apply to the payment agreement
	 - Parameter challengeResponses Used when needing to complete challenge(s) to complete payment.
	 - Parameter fraudPayload Used to complete the fraud check
	 */
	func update(
		paymentToken: String,
		paymentAgreement: UpdatePaymentAgreementRequest,
		challengeResponses: [ChallengeResponse]?,
		fraudPayload: FraudPayload,
		completion: @escaping ApiCompletion<PaymentAgreement>
	)
}
