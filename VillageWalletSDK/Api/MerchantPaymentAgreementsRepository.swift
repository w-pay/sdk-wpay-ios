import UIKit

public protocol MerchantPaymentAgreementsRepository {
	/**
	 Charge a [PaymentAgreement]s

	 - Parameter paymentToken: The ID.
	 - Parameter chargePaymentAgreementRequest: details of charge to make against the payment agreement
	 - Parameter fraudPayload Used to complete the fraud check
	 */
	func charge(
		paymentToken: String,
		chargePaymentAgreementRequest: ChargePaymentAgreementRequest,
		fraudPayload: FraudPayload,
		completion: @escaping ApiCompletion<DigitalPayPaymentAgreementResponse>
	)

	/**
	 Delete a [PaymentAgreement] by its associated payment token

	 - Parameter paymentToken: The ID.
	 */
	func delete(paymentToken: String, completion: @escaping ApiCompletion<Void>)
}
