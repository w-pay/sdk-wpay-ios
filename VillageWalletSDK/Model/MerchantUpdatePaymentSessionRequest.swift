import UIKit

/**
	Request to update a `PaymentSession` for a merchant.
 */
public protocol MerchantUpdatePaymentSessionRequest {
	/** Payload used to pass merchant information to the customer */
	var merchantInfo: DynamicPayload { get }

	/** The ID of the associated Payment Request */
	var paymentRequestId: String? { get }
}
