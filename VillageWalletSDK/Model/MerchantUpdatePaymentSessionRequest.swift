import UIKit

public protocol MerchantUpdatePaymentSessionRequest {
	func merchantInfo() -> DynamicPayload

	func paymentRequestId() -> String?
}
