import UIKit

public protocol MerchantPaymentAgreementsRepository {
	/**
	 Charge a [PaymentAgreement]s

	 - Parameter paymentToken: The ID.
	 - Parameter chargePaymentAgreementRequest: details of charge to make against the payment agreement
	 */
	func charge(
		paymentToken: String,
		chargePaymentAgreementRequest: ChargePaymentAgreementRequest,
		completion: @escaping ApiCompletion<DigitalPayPaymentAgreementResponse>
	)

	/**
	 Delete a [PaymentAgreement] by its associated payment token

	 - Parameter paymentToken: The ID.
	 */
	func delete(paymentToken: String, completion: @escaping ApiCompletion<Void>)
}
