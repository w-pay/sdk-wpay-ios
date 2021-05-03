import UIKit

public protocol OpenPayApiRepository {
	/**
	 Make payments to a merchant using Openpay payment tokens.

	 - Parameter paymentRequest: detail of payment to be made
	 */
	func pay(
		paymentRequest: OpenPayPaymentRequest,
		completion: @escaping ApiCompletion<OpenPayPaymentTransactionResponse>
	)

	/**
	 Complete pre-authed Openpay payments. This API is IP restricted to allow unauthenticated server side calls.

	 - Parameter completionRequest: detail of payment to be completed
	 */
	func complete(
		completionRequest: OpenPayCompletionRequest,
		completion: @escaping ApiCompletion<OpenPayCompletionResponse>
	)

	/**
	 Void (cancel) pre-authed Openpay payments. This API is IP restricted to allow unauthenticated server side calls.

	 - Parameter voidRequest: detail of payment to be voided
	 */
	func voidPayment(
		voidRequest: OpenPayVoidRequest,
		completion: @escaping ApiCompletion<OpenPayVoidResponse>
	)

	/**
	 Make payments to a merchant using Openpay payment tokens.

	 - Parameter refundRequest: detail of payment to be refunded
	 */
	func refund(
		refundRequest: OpenPayRefundRequest,
	  completion: @escaping ApiCompletion<OpenPayRefundResponse>
	)
}
