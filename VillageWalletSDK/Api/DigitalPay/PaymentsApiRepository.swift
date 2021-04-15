import UIKit

public protocol PaymentApiRepository {
	/**
	 Make payments to a merchant using payment intruments.

	 - Parameter paymentRequest: detail of payment to be made
	 */
	func pay(
		paymentRequest: DigitalPayPaymentRequest,
		completion: @escaping ApiCompletion<DigitalPayPaymentResponse>
	)

	/**
	 Make guest payments to a merchant using guest payment intruments.

	 - Parameter paymentRequest: detail of payment to be made
	 */
	func guestPayment(
		paymentRequest: DigitalPayPaymentRequest,
		completion: @escaping ApiCompletion<DigitalPayPaymentResponse>
	)

	/**
	 Complete pre-authed Openpay payments. This API is IP restricted to allow unauthenticated server side calls.

	 - Parameter completionRequest: detail of payment to be completed
	 */
	func complete(
		completionRequest: DigitalPayCompletionRequest,
		completion: @escaping ApiCompletion<DigitalPayCompletionResponse>
	)

	/**
	 Void (cancel) pre-authed Openpay payments. This API is IP restricted to allow unauthenticated server side calls.

	 - Parameter voidRequest: detail of payment to be voided
	 */
	func voidPayment(
		voidRequest: DigitalPayVoidRequest,
		completion: @escaping ApiCompletion<DigitalPayVoidResponse>
	)

	/**
	 Make payments to a merchant using Openpay payment tokens.

	 - Parameter refundRequest: detail of payment to be refunded
	 */
	func refund(
		refundRequest: DigitalPayRefundRequest,
		completion: @escaping ApiCompletion<DigitalPayRefundResponse>
	)
}
