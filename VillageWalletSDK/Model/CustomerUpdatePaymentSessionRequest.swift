import UIKit

/**
	Request to update the customer messages to the merchant in the `PaymentSession`
 */
public protocol CustomerUpdatePaymentSessionRequest {
	/** Payload used to pass customer information back to the merchant */
	var customerInfo: DynamicPayload { get }
}
