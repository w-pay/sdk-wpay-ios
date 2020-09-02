import UIKit

public protocol MerchantUpdatePaymentSessionRequest {
	var merchantInfo: DynamicPayload { get }

	var paymentRequestId: String? { get }
}
